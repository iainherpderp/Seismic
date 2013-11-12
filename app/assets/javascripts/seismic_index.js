// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// Set global variable for map.
// Global scope required to update from timeout.
var SEISMIC = {};
SEISMIC.map;
SEISMIC.quakeData;
SEISMIC.lastQuakeID;
SEISMIC.autoUpdate = false;

function updateEarthquakes(quakeData) {

    // Get location of latest earthquake
    var latestQuake = quakeData.features[0];

    // Update table
    // Reload ruby-formatted table (easier than JS formatting all the bits)
    // Also useful for update human times
    $('#earthquakes').load('/' + window.location.search + ' #earthquakes-table', function () {
        $('#earthquakes-table tbody tr').unbind('click').click(rowClick);
    })

    // Check if there are any new quakes, and move map etc if so.
    if (latestQuake.id != SEISMIC.lastQuakeID) {
        // Set up new maps location
        var newLocation = new google.maps.LatLng(latestQuake.geometry.coordinates[1], latestQuake.geometry.coordinates[0]);

        // Move map
        SEISMIC.map.panTo(newLocation);

        // Shake!
        $('#top-wrap').effect('shake', {times: 3, distance: 5});

        SEISMIC.lastQuakeID = latestQuake.id;

        console.log("New earthquakes!")
    } else {
        // No new earthquakes to report
        console.log("No new earthquakes.")
    }
}

function rowClick() {
    var loc = new google.maps.LatLng($(this).data('coords')[1], $(this).data('coords')[0]);
    map.panTo(loc); 
    window.location.hash = "map-wrap";
}

function toggleAutoUpdate() {
    if (SEISMIC.autoUpdate) {
        clearInterval(SEISMIC.autoUpdate);
        SEISMIC.autoUpdate = false;
        $('#auto-update').removeClass("updating").addClass("not-updating").text('Auto update off');
    } else {
        SEISMIC.autoUpdate = setInterval(getEarthquakes, 30000)
        if (SEISMIC.autoUpdate) {
            $('#auto-update').removeClass("not-updating").addClass("updating").text('Auto update on');
        }
    }
}

$(function () {
        if ($('#earthquakes-table').length) {
            // Set update to run every x seconds
            toggleAutoUpdate();
            $('#auto-update').click(toggleAutoUpdate);

            $('#earthquakes-table tbody tr').click(rowClick);
        }
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
