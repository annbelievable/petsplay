// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


handler = Gmaps.build('Google');
handler.buildMap({ internal: {id: 'one_marker'}}, function(){
  markers = handler.addMarkers([
    {
      lat: 0,
      lng: 0,
      picture: {
        url: "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
        width:  36,
        height: 36
      },
      infowindow: "hello!"
    }
  ]);
});
    
