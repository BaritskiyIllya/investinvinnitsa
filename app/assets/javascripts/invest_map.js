var tag = document.createElement('script');
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

var players = {};
function onYouTubeIframeAPIReady() {

    $(".slick iframe").each(function(id) {
        var $iframe = $(this).get(0);

        if ($iframe) { //If iFrame exists and has an ID
            players = new YT.Player($iframe, {
                events: {
                    'onReady': onPlayerReady,
                    'onStateChange': onPlayerStateChange
                }
            });

        }
    });

}

// Start Slick autoplay when Youtube Player is ready
function onPlayerReady() {
    console.log('Slider is ready for autoplay');
    $('.main-slider').slick('slickPlay');
}

// On player change callback
function onPlayerStateChange(obj) {

    // -1 (unstarted)
    // 0 (ended)
    // 1 (playing)
    // 2 (paused)
    // 3 (buffering)
    // 5 (video cued)

    if (obj.data == 1) { // means video is playing

        $('.main-slider').slick('slickPause');

        console.log('playing');

    } else if (obj.data == 2) { // means video in on pause

        $('.main-slider').slick('slickPlay');

        console.log('NOT playing');

    }
}
(function($) {
    jQuery(document).ready(function($) {


        $(".main-slider").on("beforeChange", function(event, slick) {
            var currentSlide, player, command;

            // Find the current slide element and decide which player API we need to use.
            currentSlide = $(slick.$slider).find(".slick-current");


            // Get the iframe inside this slide.
            player = currentSlide.find("iframe").get(0);

            // Special parametrs for Youtube API
            command = {
                "event": "command",
                "func": "pauseVideo"
            };


            //check if the player exists.
            if ( player != undefined ) {

                //post our command to the iframe.
                player.contentWindow.postMessage(JSON.stringify(command), "*");

            }



        });

        //start the slider
        $('#main-slider').slick({
            lazyLoad: 'ondemand',
            slidesToShow: 1,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 3000,
            dots: true,
            infinite: true,
            adaptiveHeight: true,
            arrows: false
        });

        //run the fitVids jQuery plugin to ensure the iframes stay within the item.
        $('.item').fitVids();

    });
})(jQuery);



$('.projects').slick({
  lazyLoad: 'ondemand',
  slidesToShow: 2,
  autoplay: true,
  autoplaySpeed: 5000,
  nextArrow: '<div class="slider-nav-arrow next"><i class="fa fa-caret-right"></i></div>',
  prevArrow: '<div class="slider-nav-arrow prev"><i class="fa fa-caret-left"></i></div>',
  responsive: [
    {
      breakpoint: 768,
      settings: {
        slidesToShow: 1
      }
    }
  ]
});

$().ready(function() {
  $('#select_1').addClass('hidden');
  $('#clear_1').removeClass('hidden');
  $('#panel_collapse_1').addClass('show');
});

$('.resizer').click(function () {
  $('#map_info, #invest_map').toggleClass('resized');
});

$('#gis_info .go-to-filter').bind('click', function (e) {
  e.preventDefault();
  $('#map_filter, #gis_info').toggleClass('hidden');
});

function initGoogleMap(){
  var areasLayer;
  var centerOfUkraine = {lat: 49.2333644, lng: 28.4583545};
  var infowindow = new google.maps.InfoWindow();
  var customMapLayers = {};

  var map = new google.maps.Map(document.getElementById('invest_map'), {
    zoom: 13,
    center: centerOfUkraine,
    mapTypeControlOptions: {
      position: google.maps.ControlPosition.TOP_CENTER,
      mapTypeIds: ['roadmap', 'satellite', 'terrain'],
      style: google.maps.MapTypeControlStyle.DROPDOWN_MENU
    }
  });

  map.addListener('maptypeid_changed', function () {
    var showStreetViewControl = map.getMapTypeId();
    map.setOptions({
      streetViewControl: showStreetViewControl
    });
  });

  google.maps.event.addListener(map.data, 'click', function (event) {
    toggle_bounce(event.feature.getProperty('id'), event.feature.getProperty('model'));
  });

  $('.map-filter').change(function () {
    var id = $(this).attr('data-group');
    change_buttons(id);
    apply_filter();
  });

  function change_buttons(id) {
    if (selected(id)) {
      $('#select_' + id).addClass('hidden');
      $('#clear_' + id).removeClass('hidden');
    } else {
      $('#clear_' + id).addClass('hidden');
      $('#select_' + id).removeClass('hidden');
    }
  }

  function selected(id) {
    var status = true;
    $('.checkbox').find('.magic-checkbox[data-group=' + id + ']').each(function () {
      if ($(this).prop("checked") === false) {
        status = false;
      }
    });
    return status;
  }

  $('.select-all').click(function () {
    var id = $(this).attr('id').split('_')[1];
    $('#panel_collapse_' + id).find('.map-filter').each(function(){
      $(this).prop("checked", true).change();
    });
    $(this).addClass('hidden');
    $(this).siblings('.clear').removeClass('hidden');
  });

  $('.clear').click(function () {
    var id = $(this).attr('id').split('_')[1];
    $('#panel_collapse_' + id).find('.map-filter').each(function () {
      $(this).prop("checked", false).change();
    });
    $(this).addClass('hidden');
    $(this).siblings('.select-all').removeClass('hidden');
  });

  $.ajax({
    url: '/geo_json_gis',
    dataType: 'json',
    success: function(response){
      areasLayer = map.data;
      areasLayer.addGeoJson(response);
      areasLayer.setStyle(function(feature) {
        var strokeWeight;

        if(feature.getProperty('type') === 'Polygon'){
          strokeWeight = 1;
        }else{
          strokeWeight = 4;
        }

        return {
          icon: feature.getProperty('icon'),
          strokeWeight: strokeWeight,
          fillColor: feature.getProperty('fillColor'),
          strokeColor: feature.getProperty('strokeColor')
        }
      });

      areasLayer.addListener('mouseover', function(event){
        var geometry;

        if (event.feature.getProperty('type') === 'Point'){
          geometry = event.feature.getGeometry().get();
          infowindow.setOptions({pixelOffset: new google.maps.Size(0, -35)});
        }else{
          geometry = event.latLng;
          infowindow.setOptions({pixelOffset: new google.maps.Size(0, 0)});
        }

        var html = build_pop_up(event.feature.getProperty('pop_up'));
        infowindow.setContent(html);
        infowindow.setPosition(geometry);
        infowindow.open(map);
      });

      areasLayer.addListener('click', function (event) {
        var id = event.feature.getProperty('id');
        var model = event.feature.getProperty('model');
        map.setCenter(event.latLng);
        get_object_info(id, model);
      });
      areasLayer.setMap(map);
      apply_filter();
      select_map_layers(map);
    }
  });

  $("input.map-filter[data-layer='true']").change(function () {
    if ($(this).is(":checked")) {
      push_overlay_map($(this), map)
    } else {
      map.overlayMapTypes.removeAt(get_layer_index($(this).val(), map));
    }
    zoningInformation($(this));
  });

  $('.zoning-info-icon').click(function () {
    if ($(this).hasClass('checked-icon')){
      $('.zoning-info-icon').removeClass('checked-icon');
      hideZoningInfo();
    }else{
      $('.zoning-info-icon').removeClass('checked-icon');
      $(this).addClass('checked-icon');
      openZoningInfo($(this));
    }
  });

  $('.close-zoning').click(function () {
    $('.zoning-info-icon').removeClass('checked-icon');
    hideZoningInfo();
  });

  function zoningInformation(checkbox) {
    if (checkbox.siblings('.zoning-info-icon').length) {
      if (checkbox.is(":checked")) {
        checkbox.siblings('.blank-block').css('display', 'none');
        checkbox.siblings('.zoning-info-icon').css('display', 'inline-block');
      } else {
        checkbox.siblings('.zoning-info-icon').css('display', 'none').removeClass('checked-icon');
        checkbox.siblings('.blank-block').css('display', 'inline-block');
      }
      $('.zoning-info-icon').removeClass('checked-icon');
      hideZoningInfo();
    }
  }

  function openZoningInfo(icon) {
    var image_url = icon.attr('data-info');
    $('#zoning_info_place').children('.photo').empty().append('<img src="' + image_url +'">');
    $('#zoning_info_place').addClass('opened');
  }

  function hideZoningInfo() {
    $('#zoning_info_place').removeClass('opened')
  }

  function get_layer_index(name, map) {
    var i = null;
    map.overlayMapTypes.forEach(function (object, index) {
      if (object.name === name) {i = index}
    });
    return i;
  }

  function get_object_info(id, model){
    $.ajax({
      url: '/select_object_info',
      dataType: 'script',
      data: { gis:{ id: id, model: model }}
    })
  }

  function toggle_bounce(feature_id, feature_model) {
    map.data.forEach(function (feature) {
      map.data.overrideStyle(feature, {animation: false});
      if (feature.getProperty('id') === feature_id && feature.getProperty('model') === feature_model) {
        map.data.overrideStyle(feature, {animation: google.maps.Animation.BOUNCE});
      }
    });
  }

  function apply_filter() {
    var filter_ids = [];

    $('input.map-filter[data-layer=\'false\']').each(function () {
      if ($(this).is(":checked")) {
        filter_ids.push($(this).val())
      }
    });

    map.data.forEach(function (feature) {
      if (filter_ids.includes(String(feature.getProperty('map_layer'))) || filter_ids.length === 0){
        map.data.overrideStyle(feature, {visible:true})
      }else{
        map.data.overrideStyle(feature, {visible:false})
      }
    })
  }

  function build_pop_up(prop) {
    var str = '<div><table>';
    $.each(prop, function (key, hash) {
      str = str + '<tr><td>' + hash.title + '</td><td>' + hash.value + '</td></tr>'
    });
    return str + '</table></div>';
  }

  function select_map_layers(map) {
    $.ajax({
      url: '/init_map_layers',
      dataType: 'json',
      async: false,
      success: function (layers) {
        layers.array.forEach(function (layer) {
          customMapLayers[layer.layer_id] = {};
          customMapLayers[layer.layer_id].link = layer.link;
        });

        $("input.map-filter[data-layer='true']").each(function () {
          if ($(this).is(":checked")) {
            push_overlay_map($(this), map)
          }
        });
      }
    });
  }

  function push_overlay_map(input, map) {
    var name = input.val();
    var link = customMapLayers[name].link;
    var l = new google.maps.ImageMapType({
      name: name,
      getTileUrl: function (coord, zoom) {
        var url = link
          .replace('{x}', coord.x)
          .replace('{y}', coord.y)
          .replace('{z}', zoom);
        return url;
      },
      tileSize: new google.maps.Size(256, 256),
      minZoom: 1,
      maxZoom: 20
    });
    map.overlayMapTypes.push(l);
  }
}
