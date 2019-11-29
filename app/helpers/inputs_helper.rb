module InputsHelper
  # ckeditor input
  def ckeditor_input(form, field_name, lang='uk', height=500)
    form.input(
      field_name,
      as: :ckeditor,
      label: false,
      input_html: {
        ckeditor: {
          height: height,
          language: lang,
          customConfig: asset_path('ckeditor/config.js'),
          contentsCss: asset_path('ckeditor/fonts.css')
        }
      }
    )
  end
end
