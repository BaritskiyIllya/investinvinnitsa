//= require markup/video
//= require markup/sectors
//= require markup/guide
//= require markup/tourism

$(document).ready(function () {

  $('#partners-items').slick({
    slidesToShow: 3,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 2000,
    arrows: false,
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 2
        }
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1
        }
      }
    ]
  });

  $('#home-reviews').slick({
    slidesToShow: 2,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 7000,
    arrows: false,
    vertical: true,
    verticalSwiping: true
  });

  var el = $('#partners-parallax-window');
  el.parallax({ imageSrc: el.attr('data-image-src')});


  $('#navigation-menu').slicknav({
    label: '',
    duration: 500,
    easingOpen: "easeOutBounce",
    prependTo:'#mob-bars'
  });

  var loading = false;
  $('.btn-pagination').on('click', function(e){
    if(loading){ return; }
    loading = true;
    timer = setTimeout(function(){
      var wrap = $('#pagination-list');
      $.ajax({
        url: wrap.attr('data-url'),
        dataType: 'script',
        data: {
          page: wrap.attr('data-next-page')
        },
        complete: function(){
          loading = false;
        }
      })
    }, 300);
  })


  $('#feedback').on('show.bs.modal', function (e) {
    $('footer, #partners, .parallax-mirror').addClass('blur');
  })
  $('#feedback').on('hidden.bs.modal', function (e) {
    $('footer, #partners, .parallax-mirror').removeClass('blur');
  })
});
