// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require bootstrap-button
//= require bootstrap-wysihtml5
//= require script
//= require_tree .
//= require chosen.jquery
//= require rails.validations
//= require rails.validations.simple_form


jQuery(function($){
    var addToHomeConfig = { touchIcon: true };
    $('.chzn-select').chosen({width:"500px"});
    $('.wysihtml5').each(function(i, elem) { $(elem).wysihtml5({
        "font-styles": false, //Font styling, e.g. h1, h2, etc. Default true
        "emphasis": true, //Italics, bold, etc. Default true
        "lists": true, //(Un)ordered lists, e.g. Bullets, Numbers. Default true
        "html": true, //Button which allows you to edit the generated HTML. Default false
        "link": true, //Button to insert a link. Default true
        "image": false, //Button to insert an image. Default true,
        "color": false //Button to change color of font  
      });});
});

$(function () {  
  // fix for dropdown on ipad
  $('body').on('touchstart.dropdown', '.dropdown-menu', function (e) { e.stopPropagation(); });

  fixZoom();

  // alert feedback  
  var alert = $('.alert');
  if (alert.length > 0) {
    $('#close_link').click(function() {
      alert.slideUp()
    });
    alert.show().animate({height: alert.outerHeight()}, 200);

    window.setTimeout(function() {
      alert.slideUp();
    }, 4000);
  }
});

function fixZoom(){
  if (navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPad/i)) {
      var viewportmeta = document.querySelector('meta[name="viewport"]');
      if (viewportmeta) {
          viewportmeta.content = 'width=device-width, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0';
          document.body.addEventListener('gesturestart', function () {
              viewportmeta.content = 'width=device-width, minimum-scale=0.25, maximum-scale=1.6';
          }, false);
      }
  }
}

function mapInit() {
    var styles =   [
        {
            stylers: [      
                { saturation: -100 }
            ]
        },{
            featureType: 'road',
            elementType: 'geometry',
            stylers: [
                { lightness: 100 },
                { visibility: 'simplified' }
            ]
        },{
            featureType: 'road',
            elementType: 'labels',
            stylers: [
                { visibility: 'off' }
            ]
            }
        ]
        styledMap = new google.maps.StyledMapType(styles, {name: 'Styled Map'})
        Gmaps.map.map.mapTypes.set('map_style', styledMap);
        Gmaps.map.map.setMapTypeId('map_style');
        Gmaps.map.infobox = function(boxText) {
          return {
             content: boxText
            ,disableAutoPan: false
            ,maxWidth: 0
            ,pixelOffset: new google.maps.Size(-140, 0)
            ,zIndex: null
            ,boxStyle: { 
              background: none
              ,opacity: 0.75
              ,width: "280px"
               }
            ,closeBoxMargin: "10px 2px 2px 2px"
            ,closeBoxURL: "http://www.google.com/intl/en_us/mapfiles/close.gif"
            ,infoBoxClearance: new google.maps.Size(1, 1)
            ,isHidden: false
            ,pane: "floatPane"
            ,enableEventPropagation: false
         }};
};


