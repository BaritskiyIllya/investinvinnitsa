$(document).ready(function(){

  function resetCropperMsg(wrapper) {
    wrapper.find('.cropper_input').val('');
    wrapper.find('.msg-img-croper').html('Upload a file to start cropping');
    wrapper.find('.cropper_output').val('destroy');
  }

  $('.cropper_container').each(function(index, cropper_item){
    var $cropper_item = $(cropper_item);
    var $wrapper = $cropper_item.closest('.cropper_wrapper'),
        options = JSON.parse($wrapper.attr('data-options'));
    $cropper_item.croppie(options);
  });

  $('.resetCroppedImg').on('click', function(e) {
    e.preventDefault();
    resetCropperMsg($(this).closest('.cropper_wrapper'));
  });

  $('.getCroppedImage').on('click', function() {
    var wrapper = $(this).closest('.cropper_wrapper');
    if(!wrapper) {
      console.log('Wrapper is false: click getCroppedImage');
      return;
    }
    var msg_img_croper = wrapper.find('.msg-img-croper'),
        imageFormat = 'png',
        cropper = wrapper.find('.cropper_container');

    if(/.jpg|.jpeg$/.test(wrapper.find('.cropper_input').val().toLowerCase())) {
      imageFormat = 'jpeg';
    }
    cropper.croppie('result', {
      type: 'base64',
      size: 'original',
      format: imageFormat,
      quality: 1
    })
    .then(function(croppedImgData) {
      wrapper.find('.cropper_output').val(croppedImgData);
      var img = $('<img>');
      img.addClass('img-responsive').attr('src', croppedImgData);
      msg_img_croper.html(img);
      var removeBtn = $('<a></a>');
      removeBtn.text('Скинути')
        .attr('href', '#').attr('class', 'resetCroppedImg')
        .addClass('btn btn-default mt10')
        .on('click', function(e) {
          e.preventDefault();
          resetCropperMsg(wrapper);
      });
      msg_img_croper.append(removeBtn);
      if (msg_img_croper.is(':hidden')) {
        wrapper.find('.msg-img-croper, .up-img-cropper, .get-image').toggle('show');
      }
    }).then(function(data){
      cropper.croppie('destroy');
      var options = JSON.parse(wrapper.attr('data-options'));
      cropper.croppie(options);
    });
  });

  $('.cropper_input').on('change', function () {
    var wrapper = $(this).closest('.cropper_wrapper');
    if(!wrapper) {
      console.log('Wrapper is false: change cropper_input');
      return;
    }
    var msg_img_croper = wrapper.find('.msg-img-croper');

    if(!/.png|.jpg|.jpeg|.gif$/.test(wrapper.find('.cropper_input').val())) {
      msg_img_croper.parent().prepend('<div class="incorrect-format alert alert-warning">Не вірний формат</div>');
      setTimeout(function(){
        $('.incorrect-format.alert.alert-warning').remove();
      }, 1000);
      return false;
    }
    if (this.files && this.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        wrapper.find('.cropper_container').croppie('bind', {
          url: e.target.result
        });
      };
      reader.readAsDataURL(this.files[0]);
      if (msg_img_croper.is(':visible')) {
        wrapper.find('.msg-img-croper, .up-img-cropper, .get-image').toggle('show');
      }
    }
  });
});
