$(document).ready(function(){
  var root_url = window.location.protocol + '//' + window.location.host;
  $.getScript("https://www.youtube.com/iframe_api", onYouTubeIframeAPIReady);

  var player;
  function onYouTubeIframeAPIReady(data, textStatus, jqxhr) {
    $('span.circle').click(function(e){
      player = new YT.Player('utube-video', {
        height: '1280px',
        width: '720px',
        videoId: $('#thumb-video').attr('data-video'),
        playerVars: {
          enablejsapi: 1,
          origin: root_url.toString(),
          rel: 0,
          showinfo: 0,
          iv_load_policy: 3,
          controls: 2,
          modestbranding: 1
        },
        events: {
          'onReady': onPlayerReady
        }
      });
      $('span.circle').unbind('click');
    })
  }

  function onPlayerReady(event) {
    $('#utube-video').css('z-index', 1);
    var el = $('#thumb-video');
    el.height(el.width()*9/16);
    $(window).trigger('resize').trigger('scroll'); // for parallax
    event.target.playVideo();
  }

  $("#home-video a.run-video").click(function(e) {
    e.preventDefault();
    $([document.documentElement, document.body]).animate({
        scrollTop: $("#thumb-video").offset().top
    }, 2000);
  });

})
