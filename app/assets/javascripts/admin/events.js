$(document).ready(function(){
  if($('#events-app').length == 0) { return; }

  var initData = JSON.parse($('#events-app').attr('data-init'));
  var events = new Vue({
    el: '#events-app',
    data: {
      events: []
    },
    created: function () {
      this.fetchData()
    },
    methods: {
      addField: function(){
        this.events.push({
          title_uk: '',
          title_en: '',
          id: '',
          deleted: false
        })
      },
      removeField: function(index){
        Vue.set(this.events[index], 'deleted', true);
      },
      fetchData: function() {
        this.events = initData['events'];
      }
    }
  })
})
