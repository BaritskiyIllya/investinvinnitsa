$(document).ready(function(){

  $.fn.extend({
    animateCss: function(animationName, callback) {
      var animationEnd = (function(el) {
        var animations = {
          animation: 'animationend',
          OAnimation: 'oAnimationEnd',
          MozAnimation: 'mozAnimationEnd',
          WebkitAnimation: 'webkitAnimationEnd',
        };

        for (var t in animations) {
          if (el.style[t] !== undefined) {
            return animations[t];
          }
        }
      })(document.createElement('div'));

      this.addClass('animated ' + animationName).one(animationEnd, function() {
        $(this).removeClass('animated ' + animationName);

        if (typeof callback === 'function') callback();
      });

      return this;
    },
  });

  var sections = undefined;
  $('.control-section').on('click', function(){
    $('.intianl-step').animateCss('fadeOutUpBig');
    $('.intianl-step').hide();
    if($(this).hasClass('btn-resident')) {
      sections = $('.resident .step-section');
    } else {
      $('.wrap-noresident').show();
      sections = $('.step-section');
    }
    $('.wrap-resident').show();
    sections.animateCss('bounceInUp');
    $('.back-step').show();
  })

  $('.back-step').on('click', function(e){
    e.preventDefault();
    $('.back-step').hide();
    $('.intianl-step').removeClass('animated fadeOutUpBig');
    $('.step-section').animateCss('bounceOutBottom');
    $('.wrap-noresident, .wrap-resident').hide();
    $('.intianl-step').show();
    $('.intianl-step').animateCss('bounceInDown');
  })
})
