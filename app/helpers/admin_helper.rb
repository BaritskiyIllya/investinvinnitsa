module AdminHelper
  def cropper_for(form, input, img, options={})
    viewport = {
      width: options.fetch(:width, 300),
      height: options.fetch(:height, 300)
    }
    boundary = {
      width: options.fetch(:boundary_width, 600),
      height: options.fetch(:boundary_height, 600)
    }
    opt_cropper = {
      viewport: viewport,
      boundary: boundary,
      enableResize: options.fetch(:enableResize, true),
      enableOrientation: true,
      initialZoom: '0.01'
    }
    content_tag :div, class: 'cropper_wrapper', data: { options: opt_cropper.to_json } do
      concat form.input input.to_sym, as: :hidden, input_html: { class: 'cropper_output' }
      concat render(partial: 'admin/blocks/cropper', locals: { image: img, input: input.to_s })
    end
  end

  def content_without_desc
    %w[why_vin benefit_index benefit_rating benefit_place benefit_it watch_video]
  end
end
