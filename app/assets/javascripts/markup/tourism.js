$(document).ready(function(){
  if($('#trips-slider').length) {
    var swiper = new Swiper('#trips-slider', {
      grabCursor: true,
      centeredSlides: true,
      slidesPerView: 3,
      spaceBetween: 40,
      initialSlide: 1,
      loop: true,
      autoplay: {
        delay: 3000,
      },
      coverflowEffect: {
        rotate: 0,
        stretch: 0,
        depth: 100,
        modifier: 1,
        slideShadows : true,
      },
      breakpoints: {
        576: {
          slidesPerView: 1,
          spaceBetween: 0
        },
        768: {
          slidesPerView: 2
        }
      }
    });
  }
  $('.collapse-events').on('click', function(e){
    var $wrap = $(this).closest('.event-card');
    $wrap.toggleClass('opened');
  })
})
