$(document).ready(function(){
  var tabs = $('#sectors #v-pills-tab > a'),
      $bar = $('#sector-bar'),
      $tab;
  tabs.click(function (e) {
    var $ev = $(this);
    tabs.removeClass('competed');
     tabs.each(function(index, el){
       $tab = $(el);
       $tab.addClass('competed');
       if($tab.is($ev)){
         if(!$tab.is(tabs.last())) {
           var pT = $('#v-pills-tab').offset().top,
             t = $ev.find('.point').offset().top;
           $bar.css('height', 'calc(5% + ' + (t - pT) + 'px)');
         } else {
           $bar.css('height', '110%');
         }
          return false;
       }
     })
  }).first().trigger('click');
})
