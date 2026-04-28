// Debug script to inject in browser console
console.log("=== Testing Doctor JS ===");

// Check if elements exist
console.log("user-name:", document.getElementById("user-name"));
console.log("btn-logout:", document.getElementById("btn-logout"));
console.log("appt-tbody:", document.getElementById("appt-tbody"));

// Check localStorage
console.log("access_token:", !!localStorage.getItem("access_token"));
console.log("user:", localStorage.getItem("user"));

// Check if functions exist
console.log("logout function:", typeof logout);
console.log("api object:", typeof api);
console.log("api.get:", typeof api.get);

// Check if logout button has handler
var btn = document.getElementById("btn-logout");
console.log("btn onclick:", btn ? btn.onclick : "no button");
console.log("btn eventListeners:", btn ? btn.listeners : "cannot check");

// Try calling logout directly
console.log("Testing logout():", typeof logout === "function" ? "calling logout()" : "logout not found");
if (typeof logout === "function") {
    try {
        logout();
    } catch(e) {
        console.log("Error calling logout:", e);
    }
}