function initCropper(imgInput, options){
    var viewportWidth = 400;
    var viewportHeight = 200;
    if (typeof(options) !== 'undefined') {
        viewportWidth = options.width;
        viewportHeight = options.height;
    }

    $('#resetCroppedImg').on('click', function(e) {
        e.preventDefault();
        resetCropperMsg();
    });

    var el = document.getElementById('main-cropper');
    var cropper = new Croppie(el, {
        viewport: {
            width: viewportWidth,
            height: viewportHeight
        },
        boundary: {
            width: 600,
            height: 400
        }
    });

    $('#getCroppedImage').on('click', function() {
        cropper.result({
            type: 'base64',
            size: 'original',
            format: 'jpeg',
            quality: 0.9
        })
            .then(function(croppedImgData) {
                $(imgInput).val(croppedImgData);
                var img = $('<img>');
                img.addClass('img-responsive').attr('src', croppedImgData);
                $('.upload-msg').html(img);
                var removeBtn = $('<a></a>');
                removeBtn.text('Скинути')
                    .attr('href', '#').attr('id', 'resetCroppedImg')
                    .addClass('btn btn-default mt10')
                    .on('click', function(e) {
                        e.preventDefault();
                        resetCropperMsg();
                    });
                $('.upload-msg').append(removeBtn);

                if(options.delete_image_uk){ options.delete_image_uk.val(false); }

                if ($('.upload-msg').is(':hidden')) {
                    $('.upload-msg, .upload-wrap, .get-image').toggle('show');
                }
            });
    });

    $('#news-img').on('change', function () {
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                cropper.bind({
                    url: e.target.result
                });
            };
            reader.readAsDataURL(this.files[0]);
            if ($('.upload-msg').is(':visible')) {
                $('.upload-msg, .upload-wrap, .get-image').toggle('show');
            }
        }
    });
    function resetCropperMsg() {
        $('.upload-msg').html('Upload a file to start cropping');
        if(options.delete_image_uk){
            options.delete_image_uk.val(true);
        }else{
            $(imgInput).val('destroy');
        }
    }
}

function initEnCropper(imgEnInput, en_options){
    var viewportWidth = 400;
    var viewportHeight = 200;
    if (typeof(en_options) !== 'undefined') {
        viewportWidth = en_options.width;
        viewportHeight = en_options.height;
    }
    $('#resetCroppedEnImg').on('click', function(e) {
        e.preventDefault();
        resetCropperMsg();
    });
    var en_el = document.getElementById('main-cropper-en');
    var en_cropper = new Croppie(en_el, {
        viewport: {
            width: viewportWidth,
            height: viewportHeight
        },
        boundary: {
            width: 600,
            height: 400
        }
    });
    $('#getCroppedEnImage').on('click', function() {
        en_cropper.result({
            type: 'base64',
            size: 'original',
            format: 'png',
            quality: 1
        })
            .then(function(croppedEnImgData) {
                $(imgEnInput).val(croppedEnImgData);
                var img = $('<img>');
                img.addClass('img-responsive').attr('src', croppedEnImgData);
                $('.upload-msg-en').html(img);
                var removeEnBtn = $('<a></a>');
                removeEnBtn.text('Скинути')
                    .attr('href', '#').attr('id', 'resetCroppedEnImg')
                    .addClass('btn btn-default mt10')
                    .on('click', function(e) {
                        e.preventDefault();
                        resetCropperMsg();
                    });
                $('.upload-msg-en').append(removeEnBtn);

                if(en_options.delete_image_en){ en_options.delete_image_en.val(false); }

                if ($('.upload-msg-en').is(':hidden')) {
                    $('.upload-msg-en, .upload-wrap-en, .get-image-en').toggle('show');
                }
            });
    });
    $('#news-en-img').on('change', function () {
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                en_cropper.bind({
                    url: e.target.result
                });
            };
            reader.readAsDataURL(this.files[0]);
            if ($('.upload-msg-en').is(':visible')) {
                $('.upload-msg-en, .upload-wrap-en, .get-image-en').toggle('show');
            }
        }
    });
    function resetCropperMsg() {
        $('.upload-msg-en').html('Upload a file to start cropping');
        if(en_options.delete_image_en){
            en_options.delete_image_en.val(true);
        }else{
            $(imgEnInput).val('destroy');
        }
    }
}

function initPartialCropper(imgInput, index_id){
    var viewportWidth = 300;
    var viewportHeight = 200;

    $('#resetCroppedImg_' + index_id).on('click', function(e) {
        e.preventDefault();
        resetCropperMsg();
    });

    var el = document.getElementById('mainCropper_' + index_id);
    var cropper = new Croppie(el, {
        viewport: {
            width: viewportWidth,
            height: viewportHeight
        },
        boundary: {
            width: 600,
            height: 400
        }
    });

    $('#getCroppedImage_' + index_id).on('click', function() {
        cropper.result({
            type: 'base64',
            size: 'original',
            format: 'png',
            quality: 1
        }).then(function(croppedImgData) {
            $(imgInput).val(croppedImgData);
            var img = $('<img>');
            img.addClass('img-responsive').attr('src', croppedImgData);
            $('.upload-msg_' + index_id).html(img);
            var removeBtn = $('<a></a>');
            removeBtn.text('Скинути')
                .attr('href', '#').attr('id', 'resetCroppedImg_' + index_id)
                .addClass('btn btn-default mt10 reject-crop')
                .on('click', function(e) {
                    e.preventDefault();
                    resetCropperMsg();
                });
            $('.upload-msg_' + index_id).append(removeBtn);

            if ($('.upload-msg_' + index_id).is(':hidden')) {
                $('.upload-msg_' + index_id).toggle('show');
                $('.upload-wrap_' + index_id).toggle('show');
                $('.get-image_' + index_id).toggle('show');
            }
        });
    });

    $('#blockImg_' + index_id).on('change', function () {
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                cropper.bind({
                    url: e.target.result
                });
            };
            reader.readAsDataURL(this.files[0]);
            if ($('.upload-msg_' + index_id).is(':visible')) {
                $('.upload-msg_' + index_id).toggle('show');
                $('.upload-wrap_' + index_id).toggle('show');
                $('.get-image_' + index_id).toggle('show');
            }
        }
    });

    function resetCropperMsg() {
        $('.upload-msg_' + index_id).html('Завантажте зображення');
        $(imgInput).val('destroy');
    }
}
