require 'sanitize/iframe_white_list'
class Facebook < IframeWhiteList
  def initialize
    super(
      /\A(https?:)?\/\/(?:www\.)?facebook(?:-nocookie)?\.com\//,
      %w[
        src width height style scrolling frameborder allowTransparency allow
      ]
    )
  end
end
