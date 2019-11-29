function decimal_cut(input, cut_number){
  var tmp;
  $(document).on('keypress', input, function(e){
    function keyVal(e) {
      return String.fromCharCode( e.charCode || e.keyCode);
    }
    var input = $(this);
    var specChar = [37,38,39,40,8];
    var arr = ['1','2','3','4','5','6','7','8','9','0','.'];
    var count;

    if($.inArray(e.keyCode, specChar) != -1){
      return true;
    }

    if($.inArray('.', input.val()) != -1){
      count = $.inArray('.', input.val());
      var numberOfSymbol = cut_number + 1;
      if((count + numberOfSymbol) == input.val().length){
        return false;
      }
      count = input.val().length;
    }

    if($.inArray(keyVal(e), '.') != -1){
      if(tmp){
        return false;
      }
      tmp = true;
      if($.inArray('.', input.val()) != -1){
        return false;
      }
      return input.val().indexOf(keyVal(e)) == -1;
    }else{
      tmp = false;
    }

    return ($.inArray(keyVal(e), arr) != -1);
  })
}

function cut_negative_value(input) {
    var value = input.val();
    if (parseFloat(value)) {
        input.val(Math.abs(value))
    } else {
        input.val('')
    }
}
