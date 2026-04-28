/**
 * doctor.js — Doctor dashboard
 */

function showToast(message, type) {
  var container = document.getElementById("toast-container");
  if (!container) {
    container = document.createElement("div");
    container.id = "toast-container";
    document.body.appendChild(container);
  }
  var toast = document.createElement("div");
  toast.className = "toast toast-" + (type || "info");
  toast.textContent = message;
  container.appendChild(toast);
  setTimeout(function() { toast.remove(); }, 4000);
}

function fmtDate(iso) {
  if (!iso) return "—";
  return new Date(iso).toLocaleString();
}

function statusBadge(status) {
  return "<span class=\"badge badge-" + status + "\">" + status + "</span>";
}

function logout() {
  var token = localStorage.getItem("access_token");
  if (token) {
    fetch("http://localhost:5000/api/auth/logout", {
      method: "POST",
      headers: { "Authorization": "Bearer " + token, "Content-Type": "application/json" }
    });
  }
  localStorage.clear();
  window.location.href = "/index.html";
}

function getCurrentUser() {
  try {
    return JSON.parse(localStorage.getItem("user"));
  } catch(e) { return null; }
}

function clearSession() {
  localStorage.removeItem("access_token");
  localStorage.removeItem("refresh_token");
  localStorage.removeItem("user");
}

// ===== Appointments =====
function loadAppointments() {
  var tbody = document.getElementById("appt-tbody");
  if (!tbody) return;
  tbody.innerHTML = "<tr><td colspan='7'>Loading...</td></tr>";
  
  api.get("/api/appointments").then(function(data) {
    if (!data.success) {
      tbody.innerHTML = "<tr><td colspan='7'>Error: " + data.message + "</td></tr>";
      return;
    }
    tbody.innerHTML = "";
    var list = data.data || [];
    if (list.length === 0) {
      tbody.innerHTML = '<tr><td colspan="7" class="text-muted">No appointments</td></tr>';
      return;
    }
    list.forEach(function(a) {
      var tr = document.createElement("tr");
      tr.innerHTML = 
        "<td>" + (a.patient_name || "?") + "</td>" +
        "<td>" + fmtDate(a.scheduled_start) + "</td>" +
        "<td>" + fmtDate(a.scheduled_end) + "</td>" +
        "<td>" + (a.reason || "?") + "</td>" +
        "<td>" + (a.location || "?") + "</td>" +
        "<td>" + statusBadge(a.status) + "</td>" +
        "<td>" +
          (a.status === "pending" ? "<button class=\"btn btn-sm btn-success\" onclick=\"confirmAppt(" + a.appointment_id + ")\">Confirm</button> " : "") +
          "<button class=\"btn btn-sm btn-danger\" onclick=\"cancelAppt(" + a.appointment_id + ")\">Cancel</button>" +
        "</td>";
      tbody.appendChild(tr);
    });
  });
}

function confirmAppt(id) {
  api.put("/api/appointments/" + id, { status: "confirmed" }).then(function(data) {
    showToast(data.message, data.success ? "success" : "error");
    if (data.success) loadAppointments();
  });
}

function cancelAppt(id) {
  if (!confirm("Cancel this appointment?")) return;
  api.put("/api/appointments/" + id, { status: "cancelled" }).then(function(data) {
    showToast(data.message, data.success ? "success" : "error");
    if (data.success) loadAppointments();
  });
}

// ===== Dashboard =====
function loadDashboard() {
  api.get("/api/appointments").then(function(data) {
    if (data.success) {
      var today = new Date().toDateString();
      var appts = (data.data || []).filter(function(a) {
        return new Date(a.scheduled_start).toDateString() === today;
      });
      
      var el = document.getElementById("stat-today-appts");
      if (el) el.textContent = appts.length;
      
      var tbody = document.getElementById("dashboard-appts-tbody");
      if (tbody) {
        tbody.innerHTML = "";
        appts.forEach(function(a) {
          var tr = document.createElement("tr");
          tr.innerHTML = 
            "<td>" + (a.patient_name || "?") + "</td>" +
            "<td>" + fmtDate(a.scheduled_start) + "</td>" +
            "<td>" + fmtDate(a.scheduled_end) + "</td>" +
            "<td>" + (a.reason || "?") + "</td>" +
            "<td>" + statusBadge(a.status) + "</td>";
          tbody.appendChild(tr);
        });
        if (tbody.children.length === 0) {
          tbody.innerHTML = '<tr><td colspan="5" class="text-muted">No appointments today</td></tr>';
        }
      }
    }
  });
  
  api.get("/api/test-results/flagged").then(function(data) {
    if (data.success) {
      var el = document.getElementById("stat-flagged");
      if (el) el.textContent = (data.data || []).length;
    }
  });
}