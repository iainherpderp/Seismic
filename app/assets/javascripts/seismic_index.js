// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// Set global variable for map.
// Global scope required to update from timeout.
var map;
<<<<<<< HEAD

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
=======
var quakeData;
var lastQuakeID;

function updateEarthquakes(quakeData) {

    // Get location of latest earthquake
    var latestQuake = quakeData.file_content.features[0];

    // Check if there are any new quakes, and move map etc if so.
    if (latestQuake.id != lastQuakeID) {
        // Set up new maps location
        var newLocation = new google.maps.LatLng(latestQuake.geometry.coordinates[1], latestQuake.geometry.coordinates[0]);

        // Move map
        map.panTo(newLocation);

        // Shake!
        $('#wrapper').effect('shake', {times: 5, distance: 5});

        lastQuakeID = latestQuake.id;
    } else {
        // No new earthquakes to report
    }
>>>>>>> baf625bd0d85a75bb01d9792d742610b79684b57
}

$(function () {
        // Set update to run every x seconds
<<<<<<< HEAD
        setInterval(updateEarthquakes, 5000)
    }
);

$(function() {
    $(document).on("click", 'li', function () {
        $.ajax({
            url: "SeismicIndex#fileContent", // Route to the Script Controller method
            type: "GET",
            dataType: "text",
            data: { file_name: $(this).text() }, // This goes to Controller in params hash, i.e. params[:file_name]
            complete: function () {
            },
            success: function (data, textStatus, xhr) {
                // Do something with the response here
                console.log(data);
                //editor.setValue(data.file_content) // Show the file contents in our editor.
                // editor is defined somewhere above
                // 'file_content' is the key we use to respond
                // in the controller function below
                var container = document.getElementById("document");
                container.innerHTML = data;
            },
            error: function () {
                alert("Ajax error!")
            }
        });
    });
});
=======
        //setInterval(getEarthquakes, 5000)

        // Run on clicking "get new quakes" button
        $('button#getQuakes').click(function() {
            getEarthquakes();
        });
    }
);

function getEarthquakes() {
    $.ajax({
        url: "/", // Route to the Script Controller method
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
>>>>>>> baf625bd0d85a75bb01d9792d742610b79684b57
