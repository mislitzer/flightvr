jq = jQuery.noConflict();

if (window.location.href.indexOf("/flightstats") != -1) {
    jq(document).ready(function() {
       alert('hi'); 
    });
}