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