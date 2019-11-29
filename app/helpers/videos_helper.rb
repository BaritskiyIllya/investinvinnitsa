# frozen_string_literal: true

module VideosHelper
  def youtube_id(url)
    url = url.gsub(/(>|<)/i, '').split(/(vi\/|v=|\/v\/|youtu\.be\/|\/embed\/)/)
    if !url[2].nil?
      id = url[2].split(/[^0-9a-z_\-]/i)
      id = id[0]
    else
      id = url
    end
    id
  end

  def youtube_iframe(url)
    youtube_id = find_youtube_id url
    result = %(<iframe title="YouTube video player" id="#{youtube_id}" class="embed-responsive-item" src="//www.youtube.com/embed/#{youtube_id}?rel=0&amp;showinfo=0&enablejsapi=1&origin=#{request.protocol + request.host_with_port}"
                frameborder="0" allowfullscreen></iframe>)
    content_tag(:div, class: 'embed-responsive embed-responsive-16by9') do
      result.html_safe
    end
  end
end
