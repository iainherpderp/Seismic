// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// Set global variable for map.
// Global scope required to update from timeout.
var map;

function updateEarthquakes() {
    // Generate random values for now
    var lat = Math.random() * 180 - 90;
    var long = Math.random() * 360 - 180;

    // Set up new maps location
    var newLocation = new google.maps.LatLng(lat, long);

    // Move map
    map.panTo(newLocation);

    // Shake!
    $('#wrapper').effect('shake', {times: 5, distance: 5});
}

$(function () {
        // Set update to run every x seconds
        setInterval(updateEarthquakes, 5000)
    }
);