CKEDITOR.editorConfig = function( config )
{
    config.enterMode = CKEDITOR.ENTER_DIV;
    config.allowedContent = true;
    config.filebrowserUploadUrl = '/ckeditor/pictures';
    config.format_tags = 'p;table;h1;h2;h3;h4;h5;h6;pre;address;div';
    config.format_table = { element: 'div', name: 'Таблиця', attributes: { 'class': 'table-responsive' } };
    config.removeFormatTags = 'code,del,dfn,font,i,ins,kbd,q,samp,small,span,tt,var';
    config.toolbar = 'MyToolbar';

    // an array of fonts
    myFonts = ['Roboto-Light', 'ProximaNova-Light', 'ProximaNovaExCn-Light'];
    for(var i = 0; i < myFonts.length; i++){
        config.font_names = myFonts[i] + ';' + config.font_names;
    }

    config.toolbar_MyToolbar =
        [
            { name: 'clipboard', items : [ 'PasteText', '-', 'Undo', 'Redo' ] },
            { name: 'paragraph', items : [ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'] },
            { name: 'styles', items : [ 'Format','Font','FontSize' ] },
            { name: 'basicstyles', items : [ 'Bold', 'Italic', 'Underline', '-', 'Strike', 'RemoveFormat','Subscript','Superscript' ] },
            { name: 'colors', items : [ 'TextColor', 'BGColor' ] },
            { name: 'paragraph2', items : [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-','Blockquote' ] },
            { name: 'links', items : [ 'Link', 'Unlink', 'Anchor' ] },
            { name: 'document', items : [ 'Source']},
            { name: 'insert', items : [ 'Image', 'Table','HorizontalRule','SpecialChar','Iframe' ] },
            { name: 'tools', items : [ 'Maximize'] }

            // { name: 'styles', items : [ 'Format' ] },
            // { name: 'basicstyles', items : [ 'Bold','Italic','Underline','-','Strike','RemoveFormat' ] },
            // { name: 'colors', items : [ 'TextColor','BGColor' ] },
            // { name: 'paragraph', items : [ 'NumberedList','BulletedList', '-', 'Outdent', 'Indent', '-','Blockquote', '-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'] },
            // { name: 'links', items : [ 'Link','Unlink','Anchor' ] },
            // { name: 'insert', items : [ 'Image', 'Table','HorizontalRule','SpecialChar' ] },
            // { name: 'tools', items : [ 'Maximize'] },
            // { name: 'document', items : [ 'Source']},
            // { name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] }
            //
            //
            // { name: 'document', items : [ 'Source','-','Save','NewPage','DocProps','Preview','Print','-','Templates' ] },
            // { name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
            // { name: 'editing', items : [ 'Find','Replace','-','SelectAll','-','SpellChecker', 'Scayt' ] },
            // { name: 'forms', items : [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton',
            //     'HiddenField' ] },
            // '/',
            // { name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
            // { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv',
            //     '-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },
            // { name: 'links', items : [ 'Link','Unlink','Anchor' ] },
            // { name: 'insert', items : [ 'CreateDiv', 'Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak','Iframe' ] },
            // '/',
            // { name: 'styles', items : [ 'Styles','Format','Font','FontSize' ] },
            // { name: 'colors', items : [ 'TextColor','BGColor' ] },
            // { name: 'tools', items : [ 'Maximize', 'ShowBlocks','-','About' ] }
        ];
};
