function init_map_object(model, id, area){
    $.ajax({
        url: '/cabinet/geo_json/'+model+'/'+id,
        dataType: 'json',
        success:function (response) {
            area.map.data.addGeoJson(response);
            // AreaMap.map.data.forEach(function (feature) {
            //     if(feature){
            //         AreaMap.drawingManager.setDrawingMode(null);
            //     }
            // });

            // google.maps.event.addListener(AreaMap.map.data, 'click', function(e) {
            //     AreaMap.map.data.setStyle({draggable: true, editable: true});
            //     google.maps.event.addListener(AreaMap.map.data, 'set_at', function(e){
            //         console.log('fs')
            //     })
            // console.log(e.feature.getId())
            // google.maps.event.addListener(stateLayer.Feature.getGeometry(), 'set_at', function () { //edit point
            //     console.log('fsf')
            // });
            // google.maps.event.trigger(AreaMap.drawingManager, 'overlaycomplete', stateLayer);
            // });
        }
    })
}

function ready_map_functions() {
    var gis_type = $('#geo_info_system_gis_type_name');
    var type = gis_type.val();
    chnage_type_description(type);

    function chnage_type_description(gis_type) {
        $('.git-types .one-type').hide();
        $('#'+ gis_type).show();
    }

    gis_type.change(function () {
        chnage_type_description($(this).val());
    });

    $('.save_button input').click(function (e) {
        e.preventDefault();
        if(map_object){
            $('#geo_type').val(map_object.type);
            $('#position').val(JSON.stringify(map_object));
        }
        $('form').submit();
    })
}

function hide_gis_types() {
    $('.git-types .one-type').hide();
}