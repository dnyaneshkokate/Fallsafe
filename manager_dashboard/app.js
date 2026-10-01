/**
 * FallSafe™ Enterprise Manager Portal - Core Engine v2.1
 * Phone-to-PC Telemetry Bridge & Comprehensive Fall Detections Register
 */

const DEFAULT_EMPLOYEES = [
  {
    id: 'emp-101',
    name: 'John Miller',
    role: 'Scaffold Engineer & Inspector',
    dept: 'Sector 4 High-Rise Core',
    emergencyName: 'Elena Miller (Spouse)',
    emergencyPhone: '+919876543210',
    assignedDevice: 'FallSafe (Phone BLE Relay)',
    status: 'online',
    bpm: 78,
    lastFallTime: null,
    battery: 95,
    latitude: 28.6139,
    longitude: 77.2090
  },
  {
    id: 'emp-102',
    name: 'Sarah Jenkins',
    role: 'Tower Crane Operator',
    dept: 'Zone B Overhead Logistics',
    emergencyName: 'Mark Jenkins (Father)',
    emergencyPhone: '+919876543211',
    assignedDevice: 'FallSafe-02',
    status: 'offline',
    bpm: 72,
    lastFallTime: null,
    battery: 88,
    latitude: 28.6145,
    longitude: 77.2085
  },
  {
    id: 'emp-103',
    name: 'David Chen',
    role: 'Structural Rigging Specialist',
    dept: 'Zone A Foundation & Truss',
    emergencyName: 'Linda Chen (Sister)',
    emergencyPhone: '+919876543212',
    assignedDevice: 'FallSafe-03',
    status: 'offline',
    bpm: 80,
    lastFallTime: null,
    battery: 91,
    latitude: 28.6130,
    longitude: 77.2100
  }
];

class DashboardManager {
  constructor() {
    this.employees = this.loadEmployees();
    this.fallHistory = [];
    this.activeFilter = 'all';
    this.selectedEmployeeId = 'emp-101';
    
    // Siren / Audio Context
    this.audioCtx = null;
    this.sirenOscillator = null;
    this.isSirenPlaying = false;

    this.cacheDom();
    this.init();
  }

  cacheDom() {
    this.btnAddEmployee = document.getElementById('btnAddEmployee');
    this.btnSimulateFall = document.getElementById('btnSimulateFall');
    this.employeeGrid = document.getElementById('employeeGrid');
    this.fallAlertBanner = document.getElementById('fallAlertBanner');
    this.alertEmpName = document.getElementById('alertEmpName');
    this.alertTime = document.getElementById('alertTime');
    this.btnDispatchEmergency = document.getElementById('btnDispatchEmergency');
    this.btnAcknowledgeAlert = document.getElementById('btnAcknowledgeAlert');
    this.fallHistoryList = document.getElementById('fallHistoryList');
    this.btnClearFallLog = document.getElementById('btnClearFallLog');
    
    // Stats & Bridge UI
    this.statTotalEmployees = document.getElementById('statTotalEmployees');
    this.statActiveDevices = document.getElementById('statActiveDevices');
    this.statBridgeStatus = document.getElementById('statBridgeStatus');
    this.statIncidentCount = document.getElementById('statIncidentCount');
    this.liveBpmDisplay = document.getElementById('liveBpmDisplay');
    this.activeFeedName = document.getElementById('activeFeedName');
    this.currentTime = document.getElementById('currentTime');
    this.phoneLastSync = document.getElementById('phoneLastSync');
    this.phoneBattery = document.getElementById('phoneBattery');
    this.phoneMotionState = document.getElementById('phoneMotionState');
    this.liveGpsCoords = document.getElementById('liveGpsCoords');
    this.liveGpsLink = document.getElementById('liveGpsLink');
    this.serverBridgeUrl = document.getElementById('serverBridgeUrl');

    // Modal
    this.employeeModal = document.getElementById('employeeModal');
    this.employeeForm = document.getElementById('employeeForm');
    this.btnCloseModal = document.getElementById('btnCloseModal');
    this.btnCancelModal = document.getElementById('btnCancelModal');
  }

  init() {
    this.setupEventListeners();
    this.startClock();
    this.fetchServerInfo();
    this.renderEmployees();
    this.pollTelemetryFromServer();
    
    // Auto-poll telemetry every 1.5 seconds
    setInterval(() => this.pollTelemetryFromServer(), 1500);
  }

  // =============================================================================
  // Server Info & Live Telemetry Polling (Phone -> PC)
  // =============================================================================
  async fetchServerInfo() {
    try {
      const res = await fetch('/api/server_info');
      if (res.ok) {
        const info = await res.json();
        this.serverBridgeUrl.textContent = `${info.url}/api/telemetry`;
      }
    } catch (e) {
      console.warn('Server info query skipped');
    }
  }

  async pollTelemetryFromServer() {
    try {
      // 1. Fetch Live Telemetry State
      const res = await fetch('/api/telemetry');
      if (res.ok) {
        const state = await res.json();
        this.updateLivePhoneTelemetry(state);
      }

      // 2. Fetch Comprehensive Fall History
      const fallsRes = await fetch('/api/falls');
      if (fallsRes.ok) {
        const falls = await fallsRes.json();
        this.fallHistory = falls;
        this.renderFallHistory();
      }
    } catch (e) {
      // Offline / standalone mode fallback
    }
  }

  updateLivePhoneTelemetry(state) {
    if (!state) return;

    // Update primary worker
    const emp = this.employees.find(e => e.id === 'emp-101') || this.employees[0];
    if (state.heartRate) emp.bpm = state.heartRate;
    if (state.status) emp.status = state.status;
    if (state.latitude) emp.latitude = state.latitude;
    if (state.longitude) emp.longitude = state.longitude;

    if (emp.id === this.selectedEmployeeId) {
      this.liveBpmDisplay.textContent = emp.bpm;
      this.phoneLastSync.textContent = state.lastSync || new Date().toLocaleTimeString();
      this.phoneBattery.textContent = `${state.battery || 95}%`;
      this.phoneMotionState.textContent = state.fallDetected ? 'CRITICAL IMPACT DETECTED' : 'Normal / Stable';
      
      const lat = emp.latitude || 28.6139;
      const lng = emp.longitude || 77.2090;
      this.liveGpsCoords.textContent = `${lat.toFixed(4)}° N, ${lng.toFixed(4)}° E`;
      this.liveGpsLink.href = `https://www.google.com/maps?q=${lat},${lng}`;
    }

    // Handle Fall Detection from Phone
    if (state.fallDetected && !this.isSirenPlaying) {
      this.triggerFallAlert('emp-101', 'Fall Detected! signal relayed from Phone App.');
    }

    this.renderEmployees();
    this.updateStats();
  }

  // =============================================================================
  // Fall Alert & Audio Siren
  // =============================================================================
  triggerFallAlert(employeeId, reason = 'Impact Threshold Exceeded') {
    const emp = this.employees.find(e => e.id === employeeId) || this.employees[0];
    emp.status = 'fall_alert';
    emp.lastFallTime = new Date().toLocaleTimeString();

    // Show Emergency Banner
    this.fallAlertBanner.classList.remove('hidden');
    this.alertEmpName.textContent = `${emp.name} (${emp.dept})`;
    this.alertTime.textContent = emp.lastFallTime;

    this.startSirenAlarm();
    this.renderEmployees();
    this.updateStats();
  }

  async acknowledgeAlert() {
    this.stopSirenAlarm();
    this.fallAlertBanner.classList.add('hidden');

    try {
      await fetch('/api/falls/acknowledge', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({})
      });
    } catch (e) {}

    this.employees.forEach(emp => {
      if (emp.status === 'fall_alert') {
        emp.status = 'online';
      }
    });

    this.renderEmployees();
    this.updateStats();
    this.pollTelemetryFromServer();
  }

  dispatchEmergencyContact() {
    const alertEmp = this.employees.find(e => e.status === 'fall_alert') || this.employees[0];
    const phone = alertEmp.emergencyPhone.replace(/[^0-9+]/g, '');
    const lat = alertEmp.latitude || 28.6139;
    const lng = alertEmp.longitude || 77.2090;
    const message = encodeURIComponent(`URGENT EMERGENCY: FallSafe Alert triggered for ${alertEmp.name} at ${alertEmp.dept}.\nLocation: https://www.google.com/maps?q=${lat},${lng}\nCurrent Heart Rate: ${alertEmp.bpm} BPM.`);
    
    window.open(`https://wa.me/${phone}?text=${message}`, '_blank');
  }

  startSirenAlarm() {
    if (this.isSirenPlaying) return;
    try {
      const AudioContext = window.AudioContext || window.webkitAudioContext;
      this.audioCtx = new AudioContext();

      const osc = this.audioCtx.createOscillator();
      const gain = this.audioCtx.createGain();

      osc.type = 'sawtooth';
      osc.frequency.setValueAtTime(650, this.audioCtx.currentTime);
      
      let up = true;
      const interval = setInterval(() => {
        if (!this.isSirenPlaying || !this.audioCtx) {
          clearInterval(interval);
          return;
        }
        const now = this.audioCtx.currentTime;
        osc.frequency.cancelScheduledValues(now);
        osc.frequency.linearRampToValueAtTime(up ? 950 : 550, now + 0.35);
        up = !up;
      }, 350);

      gain.gain.setValueAtTime(0.18, this.audioCtx.currentTime);
      osc.connect(gain);
      gain.connect(this.audioCtx.destination);

      osc.start();
      this.sirenOscillator = osc;
      this.isSirenPlaying = true;
    } catch (e) {
      console.warn('Audio auto-play blocked', e);
    }
  }

  stopSirenAlarm() {
    if (this.sirenOscillator) {
      try {
        this.sirenOscillator.stop();
        this.sirenOscillator.disconnect();
      } catch (e) {}
      this.sirenOscillator = null;
    }
    if (this.audioCtx) {
      this.audioCtx.close();
      this.audioCtx = null;
    }
    this.isSirenPlaying = false;
  }

  // =============================================================================
  // Fall Detections Register / Log
  // =============================================================================
  renderFallHistory() {
    this.fallHistoryList.innerHTML = '';

    if (this.fallHistory.length === 0) {
      this.fallHistoryList.innerHTML = `
        <div style="padding: 24px; text-align: center; color: var(--color-powder); opacity: 0.8; font-size: 0.85rem;">
          No fall incidents on record. Telemetry stream clear.
        </div>
      `;
      return;
    }

    this.fallHistory.forEach(fall => {
      const isResolved = fall.status === 'Resolved' || fall.status === 'Acknowledged';
      const item = document.createElement('div');
      item.className = `fall-item ${isResolved ? 'resolved' : ''}`;

      item.innerHTML = `
        <div class="fall-item-top">
          <span class="fall-worker-name">🚨 ${fall.employeeName} (${fall.department})</span>
          <span class="fall-status-tag ${isResolved ? 'resolved' : 'active'}">${fall.status.toUpperCase()}</span>
        </div>
        <div class="fall-item-meta">
          <span>🕒 ${fall.timestamp}</span>
          <span>❤️ ${fall.heartRate} BPM</span>
          <span>📍 <a href="https://www.google.com/maps?q=${fall.latitude},${fall.longitude}" target="_blank" class="text-mint">GPS Map ↗</a></span>
        </div>
        <p class="fall-item-notes">${fall.notes}</p>
        ${!isResolved ? `
          <div class="fall-item-actions">
            <button class="btn-card-action" onclick="window.dashboard.acknowledgeFallById('${fall.id}')">
              ✓ Acknowledge
            </button>
          </div>
        ` : ''}
      `;

      this.fallHistoryList.appendChild(item);
    });
  }

  async acknowledgeFallById(fallId) {
    try {
      await fetch('/api/falls/acknowledge', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ id: fallId })
      });
      this.pollTelemetryFromServer();
    } catch (e) {}
  }

  async clearFallLog() {
    if (confirm('Are you sure you want to clear the entire fall detections register?')) {
      try {
        await fetch('/api/falls/clear', { method: 'POST' });
        this.fallHistory = [];
        this.renderFallHistory();
        this.updateStats();
      } catch (e) {}
    }
  }

  // =============================================================================
  // Employee Roster
  // =============================================================================
  renderEmployees() {
    const filter = this.activeFilter;
    const filtered = this.employees.filter(emp => {
      if (filter === 'online') return emp.status === 'online';
      if (filter === 'alert') return emp.status === 'fall_alert';
      return true;
    });

    document.getElementById('filterCountAll').textContent = this.employees.length;
    document.getElementById('filterCountOnline').textContent = this.employees.filter(e => e.status === 'online').length;
    document.getElementById('filterCountAlert').textContent = this.employees.filter(e => e.status === 'fall_alert').length;

    this.employeeGrid.innerHTML = '';

    filtered.forEach(emp => {
      const isSelected = emp.id === this.selectedEmployeeId;
      const isAlert = emp.status === 'fall_alert';
      const isOnline = emp.status === 'online';

      let statusBadgeHtml = '';
      if (isAlert) {
        statusBadgeHtml = `
          <div class="status-pill fall-alert">
            <span class="status-dot-sm dot-red"></span>
            FALL DETECTED
          </div>
        `;
      } else if (isOnline) {
        statusBadgeHtml = `
          <div class="status-pill online">
            <span class="status-dot-sm dot-green"></span>
            ONLINE (PHONE)
          </div>
        `;
      } else {
        statusBadgeHtml = `
          <div class="status-pill offline">
            <span class="status-dot-sm dot-red"></span>
            OFFLINE
          </div>
        `;
      }

      const card = document.createElement('div');
      card.className = `emp-card glass-card ${isSelected ? 'active-selected' : ''} ${isAlert ? 'in-fall-alert' : ''}`;
      card.onclick = () => this.selectEmployee(emp.id);

      const initials = emp.name.split(' ').map(n => n[0]).join('').substring(0, 2).toUpperCase();

      card.innerHTML = `
        <div class="emp-card-top">
          <div class="emp-identity">
            <div class="emp-avatar">${initials}</div>
            <div class="emp-name-role">
              <h3>${emp.name}</h3>
              <p>${emp.role}</p>
            </div>
          </div>
          ${statusBadgeHtml}
        </div>

        <div class="emp-biometrics-row">
          <div class="bio-cell">
            <span class="bio-title">HEART RATE</span>
            <div class="bio-val ${isOnline ? 'text-mint' : 'text-muted'}">
              <span>${isOnline ? emp.bpm : '--'}</span>
              <span class="bio-unit">BPM</span>
            </div>
          </div>
          <div class="bio-cell">
            <span class="bio-title">FALL SENSOR</span>
            <div class="bio-val ${isAlert ? 'text-danger' : (isOnline ? 'text-emerald' : 'text-muted')}">
              <span>${isAlert ? 'IMPACT' : (isOnline ? 'STABLE' : 'STANDBY')}</span>
            </div>
          </div>
        </div>

        <div class="emp-card-details">
          <div class="detail-line">
            <span>Zone:</span>
            <strong>${emp.dept}</strong>
          </div>
          <div class="detail-line">
            <span>Assigned Unit:</span>
            <strong class="text-cyan">${emp.assignedDevice}</strong>
          </div>
          <div class="detail-line">
            <span>Emergency SOS:</span>
            <strong>${emp.emergencyName}</strong>
          </div>
          <div class="detail-line">
            <span>Contact Phone:</span>
            <strong>${emp.emergencyPhone}</strong>
          </div>
        </div>

        <div class="emp-card-actions">
          <button class="btn-card-action" onclick="event.stopPropagation(); window.dashboard.openWhatsAppForEmp('${emp.id}')">
            📲 WhatsApp SOS
          </button>
          <button class="btn-card-action" onclick="event.stopPropagation(); window.dashboard.toggleEmployeeOnline('${emp.id}')">
            ${isOnline ? 'Set Offline' : 'Set Online'}
          </button>
          <button class="btn-card-action" onclick="event.stopPropagation(); window.dashboard.deleteEmployee('${emp.id}')" title="Delete Personnel">
            🗑️
          </button>
        </div>
      `;

      this.employeeGrid.appendChild(card);
    });
  }

  selectEmployee(empId) {
    this.selectedEmployeeId = empId;
    const emp = this.employees.find(e => e.id === empId);
    if (emp) {
      this.activeFeedName.textContent = `Selected: ${emp.name} (${emp.assignedDevice})`;
      this.liveBpmDisplay.textContent = emp.status === 'online' ? emp.bpm : '--';
      this.phoneBattery.textContent = `${emp.battery}%`;
      this.phoneMotionState.textContent = emp.status === 'fall_alert' ? 'CRITICAL IMPACT' : (emp.status === 'online' ? 'Normal / Stable' : 'Standby');
      const lat = emp.latitude || 28.6139;
      const lng = emp.longitude || 77.2090;
      this.liveGpsCoords.textContent = `${lat.toFixed(4)}° N, ${lng.toFixed(4)}° E`;
      this.liveGpsLink.href = `https://www.google.com/maps?q=${lat},${lng}`;
    }
    this.renderEmployees();
  }

  openWhatsAppForEmp(empId) {
    const emp = this.employees.find(e => e.id === empId);
    if (!emp) return;
    const phone = emp.emergencyPhone.replace(/[^0-9+]/g, '');
    const lat = emp.latitude || 28.6139;
    const lng = emp.longitude || 77.2090;
    const message = encodeURIComponent(`FallSafe Alert: Live check-in request for worker ${emp.name} (${emp.dept}). Status: ${emp.status.toUpperCase()}. Location: https://www.google.com/maps?q=${lat},${lng} Current Heart Rate: ${emp.bpm} BPM.`);
    window.open(`https://wa.me/${phone}?text=${message}`, '_blank');
  }

  toggleEmployeeOnline(empId) {
    const emp = this.employees.find(e => e.id === empId);
    if (!emp) return;
    emp.status = emp.status === 'online' ? 'offline' : 'online';
    this.renderEmployees();
    this.updateStats();
  }

  deleteEmployee(empId) {
    if (confirm('Are you sure you want to remove this personnel from live monitoring?')) {
      this.employees = this.employees.filter(e => e.id !== empId);
      this.saveEmployees();
      this.renderEmployees();
      this.updateStats();
    }
  }

  openAddEmployeeModal() {
    this.employeeForm.reset();
    this.employeeModal.classList.remove('hidden');
  }

  closeModal() {
    this.employeeModal.classList.add('hidden');
  }

  handleEmployeeFormSubmit(e) {
    e.preventDefault();
    const name = document.getElementById('inputEmpName').value.trim();
    const role = document.getElementById('inputEmpRole').value.trim();
    const dept = document.getElementById('inputEmpDept').value.trim();
    const emergencyName = document.getElementById('inputEmergencyName').value.trim();
    const emergencyPhone = document.getElementById('inputEmergencyPhone').value.trim();
    const assignedDevice = document.getElementById('inputDeviceName').value;

    const newEmp = {
      id: 'emp-' + Date.now(),
      name,
      role,
      dept,
      emergencyName,
      emergencyPhone,
      assignedDevice,
      status: 'online',
      bpm: 76,
      lastFallTime: null,
      battery: 95,
      latitude: 28.6139,
      longitude: 77.2090
    };

    this.employees.push(newEmp);
    this.saveEmployees();
    this.renderEmployees();
    this.updateStats();
    this.closeModal();
  }

  updateStats() {
    const total = this.employees.length;
    const online = this.employees.filter(e => e.status === 'online').length;
    const alerts = this.fallHistory.filter(f => f.status === 'Active Alert').length;

    this.statTotalEmployees.textContent = total;
    this.statActiveDevices.textContent = online;
    this.statIncidentCount.textContent = `${this.fallHistory.length} EVENTS`;
  }

  startClock() {
    const update = () => {
      const now = new Date();
      this.currentTime.textContent = now.toLocaleTimeString();
    };
    update();
    setInterval(update, 1000);
  }

  loadEmployees() {
    try {
      const stored = localStorage.getItem('fallsafe_employees');
      if (stored) return JSON.parse(stored);
    } catch (e) {}
    return DEFAULT_EMPLOYEES;
  }

  saveEmployees() {
    try {
      localStorage.setItem('fallsafe_employees', JSON.stringify(this.employees));
    } catch (e) {}
  }

  setupEventListeners() {
    this.btnAddEmployee.addEventListener('click', () => this.openAddEmployeeModal());
    this.btnCloseModal.addEventListener('click', () => this.closeModal());
    this.btnCancelModal.addEventListener('click', () => this.closeModal());
    this.employeeForm.addEventListener('submit', (e) => this.handleEmployeeFormSubmit(e));
    this.btnClearFallLog.addEventListener('click', () => this.clearFallLog());
    
    // Simulate Fall from Phone via POST API
    this.btnSimulateFall.addEventListener('click', async () => {
      try {
        await fetch('/api/telemetry', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            fallDetected: true,
            heartRate: 112,
            employeeName: 'John Miller',
            latitude: 28.6139,
            longitude: 77.2090
          })
        });
        this.pollTelemetryFromServer();
      } catch (e) {}
    });

    // Alert Actions
    this.btnAcknowledgeAlert.addEventListener('click', () => this.acknowledgeAlert());
    this.btnDispatchEmergency.addEventListener('click', () => this.dispatchEmergencyContact());

    // Filter Controls
    document.querySelectorAll('.filter-btn').forEach(btn => {
      btn.addEventListener('click', () => {
        document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
        this.activeFilter = btn.dataset.filter;
        this.renderEmployees();
      });
    });
  }
}

window.addEventListener('DOMContentLoaded', () => {
  window.dashboard = new DashboardManager();
});
