// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// Set global variable for map.
// Global scope required to update from timeout.
var map;
var quakeData;
var lastQuakeID;
var autoUpdate = false;

function updateEarthquakes(quakeData) {

    // Get location of latest earthquake
    var latestQuake = quakeData.features[0];

    // Check if there are any new quakes, and move map etc if so.
    if (latestQuake.id != lastQuakeID) {
        // Set up new maps location
        var newLocation = new google.maps.LatLng(latestQuake.geometry.coordinates[1], latestQuake.geometry.coordinates[0]);

        // Move map
        map.panTo(newLocation);

        // Shake!
        $('#top-wrap').effect('shake', {times: 3, distance: 5});

        // Update table
        // Reload ruby-formatted table (easier than JS formatting all the bits)
        $('#earthquakes').load('/' + window.location.search + ' #earthquakes-table')
        $('#earthquakes-table tbody tr').unbind('click').click(rowClick);

        lastQuakeID = latestQuake.id;
    } else {
        // No new earthquakes to report
        console.log("No new earthquakes.")
    }
}

function rowClick() {
    var loc = new google.maps.LatLng($(this).data('coords')[1], $(this).data('coords')[0]);
    map.panTo(loc);
}

function toggleAutoUpdate() {
    if (autoUpdate) {
        clearInterval(autoUpdate);
        autoUpdate = false;
        $('#auto-update').removeClass("updating").addClass("not-updating").text('Auto update off');
    } else {
        autoUpdate = setInterval(getEarthquakes, 30000)
        if (autoUpdate) {
            $('#auto-update').removeClass("not-updating").addClass("updating").text('Auto update on');
        }
    }
}

$(function () {
        // Set update to run every x seconds
        toggleAutoUpdate();
        $('#auto-update').click(toggleAutoUpdate);

        $('#earthquakes-table tbody tr').click(rowClick);
    }
);

function getEarthquakes() {
    $.ajax({
        url: "/getearthquakes.json", // Route to the Script Controller method
        type: "GET",
        dataType: "json",
        success: function (data) {
            quakeData = data;
            updateEarthquakes(data);
        },
        error: function () {
            console.log("Ajax error!");
        }
    });
}
