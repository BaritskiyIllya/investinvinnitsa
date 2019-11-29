var map_object;

function initMap() {
    var selectedShape;
    var markers = [];
    var polygons = [];
    var lines = [];
    var cur_type;
    var dummy_selected;
    var form_type_select = $('#geo_info_system_gis_type_name');
    var coord_input = $('#geo_info_system_geo_json_attributes_');
    var evailable_type = {
        Point: google.maps.drawing.OverlayType.MARKER,
        LineString : google.maps.drawing.OverlayType.POLYLINE,
        Polygon: google.maps.drawing.OverlayType.POLYGON
    };

    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 12,
        center: new google.maps.LatLng(49.2322868,28.4670424),
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        disableDefaultUI: true,
        zoomControl: true
    });

    var drawingManager = new google.maps.drawing.DrawingManager({
        drawingMode: evailable_type[form_type_select.val()],
        drawingControl: true,
        drawingControlOptions: {
            position: google.maps.ControlPosition.TOP_RIGHT,
            drawingModes: []
        },
        markerOptions: {
            animation: google.maps.Animation.DROP,
            draggable: true
        },
        polylineOptions: {
            strokeWeight: 3,
            fillOpacity: 0.8,
            editable: true
        },
        polygonOptions: {
            strokeWeight: 2,
            fillOpacity: 0.1,
            editable: true
        },
        map: map
    });

    function initialize() {
        google.maps.event.addListener(drawingManager, 'overlaycomplete', function(e) {
            drawingManager.setDrawingMode(null);
            var newShape = e.overlay;
            newShape.type = e.type;
            set_new_coordinates(newShape.type, newShape);

            if (newShape.type == google.maps.drawing.OverlayType.MARKER) {
                markers.push(newShape);
                add_event_click(newShape);
                add_event_dragend(newShape);
                setSelection(newShape);
            }else if (newShape.type == google.maps.drawing.OverlayType.POLYLINE){
                lines.push(newShape);
                add_event_click(newShape);
                add_event_set_at(newShape);
                add_event_insert_at(newShape);
                setSelection(newShape);
            }else{
                polygons.push(newShape);
                add_event_click(newShape);
                add_event_set_at(newShape);
                add_event_insert_at(newShape);
                setSelection(newShape);
            }
        });

        // Clear the current selection when the drawing mode is changed, or when the
        // map is clicked.

        google.maps.event.addListener(drawingManager, 'drawingmode_changed', clearSelectionAll);
        google.maps.event.addListener(map, 'click',  clearSelectionAll);
        google.maps.event.addDomListener(document.getElementById('delete-all-button'), 'click', clearAll);
        buildColorPalette();

        form_type_select.change(function () {
            map_object = null;
            drawingManager.setDrawingMode(evailable_type[$(this).val()]);
            clearAll();
        });
    }

    google.maps.event.addDomListener(window, 'load', initialize);

    function add_event_dragend(newShape) {
        google.maps.event.addListener(newShape, 'dragend', function() {
            set_new_coordinates(newShape.type, newShape);
        });
    }
    function add_event_click(newShape) {
        google.maps.event.addListener(newShape, 'click', function() {
            setSelection(newShape);
        });
    }

    function add_event_set_at(shape){
        google.maps.event.addListener(shape.getPath(), 'set_at', function() { //edit point
            set_new_coordinates(shape.type, shape);
        });
    }

    function add_event_insert_at(shape){
        google.maps.event.addListener(shape.getPath(), 'insert_at', function() { //add new point
            set_new_coordinates(shape.type, shape);
        });
    }

    function set_new_coordinates(type, overlay){
        var a = completeFactory(type, overlay);
        map_object = a.getObject();
    }

    function clearAll() {
        for (var i = 0; i < markers.length; i++ ) {
            markers[i].setMap(null);
        }
        for (var j = 0; j < lines.length; j++ ) {
            lines[j].setMap(null);
        }
        for (var k = 0; k < polygons.length; k++ ) {
            polygons[k].setMap(null);
        }

        polygons.length = 0;
        lines.length = 0;
        markers.length = 0;
        coord_input.val('[]');
        map_object = null;
        drawingManager.setDrawingMode(evailable_type[form_type_select.val()])
    }

    function clearSelectionAll() {
        dummy_selected = selectedShape;

        if (cur_type == google.maps.drawing.OverlayType.MARKER) {
            selectedShape = null;
        }else{
            if (selectedShape) {
                setTimeout(function(){
                    setTimeout(function(){
                        dummy_selected.setEditable(false);
                        dummy_selected = null;
                        selectedShape.setEditable(false);
                        selectedShape = null;
                    },100);
                },100);
            }
        }
    }

    function setSelection(shape) {
        dummy_selected = selectedShape;
        selectedShape = shape;
        cur_type = shape.type;

        if (shape.type !== google.maps.drawing.OverlayType.MARKER) {
            shape.setEditable(true);
            selectColor(shape.get('fillColor') || shape.get('strokeColor'));
        }
    }

    function selectColor(color) {
        var polylineOptions = drawingManager.get('polylineOptions');
        polylineOptions.strokeColor = color;
        drawingManager.set('polylineOptions', polylineOptions);

        var polygonOptions = drawingManager.get('polygonOptions');
        polygonOptions.fillColor = color;
        drawingManager.set('polygonOptions', polygonOptions);
    }

    function setSelectedShapeColor(color) {
        if (selectedShape) {
            if (selectedShape.type == google.maps.drawing.OverlayType.POLYLINE) {
                selectedShape.set('strokeColor', color);
                set_new_coordinates(selectedShape.type, selectedShape);
            } else {
                selectedShape.set('fillColor', color);
                set_new_coordinates(selectedShape.type, selectedShape);
            }
        }
    }

    function buildColorPalette() {
        var default_color = '#0000ff';
        $('#colorSelector').ColorPicker({
            color: default_color,
            onShow: function (colpkr) {
                $(colpkr).fadeIn(500);
                return false;
            },
            onHide: function (colpkr) {
                $(colpkr).fadeOut(500);
                return false;
            },
            onChange: function (hsb, hex, rgb) {
                var color = '#' + hex;
                $('#colorSelector div').css('backgroundColor', color);
                selectColor(color);
                setSelectedShapeColor(color);
            }
        });
        $('#colorSelector div').css('backgroundColor', default_color);
        selectColor(default_color);
    }

    return {
        map: map,
        drawingManager: drawingManager
    }
}

var MarkerBuilder = function(overlay) {
    var type = 'Point';
    var retrieveCoordinates = function () {
        return [overlay.position.lng(), overlay.position.lat()]
    };
    this.getObject = function () {
        return {
            type: type,
            coordinates: retrieveCoordinates()
        }
    }
};

var PolygonBuilder = function(overlay) {
    var type = 'Polygon';
    var color = overlay.fillColor;
    var retrieveCoordinates = function () {
        var array = overlay.getPath().getArray().map(function(item){return [item.lng(), item.lat()]});
        array.push(array[0]);
        return [array]
    };
    this.getObject = function () {
        return {
            type: type,
            coordinates: retrieveCoordinates(),
            style: {
                fillColor: color
            }
        }
    }
};

var LineBuilder = function(overlay) {
    var type = 'LineString';
    var color = overlay.strokeColor;
    var retrieveCoordinates = function () {
        return overlay.getPath().getArray().map(function(item){return [item.lng(), item.lat()]})
    };
    this.getObject = function () {
        return {
            type: type,
            coordinates: retrieveCoordinates(),
            style: {
                strokeColor: color
            }
        }
    }
};

function completeFactory(type, overlay){
    var hashTable = {
        marker: MarkerBuilder,
        polygon: PolygonBuilder,
        polyline: LineBuilder
    };
    return new hashTable[type](overlay);
}
