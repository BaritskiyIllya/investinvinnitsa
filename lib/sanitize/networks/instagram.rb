require 'sanitize/iframe_white_list'
class Instagram < IframeWhiteList
  def initialize
    super(
        /\A(https?:)?\/\/(?:www\.)?instagram(?:-nocookie)?\.com\//,
        %w[
          src width height style scrolling frameborder allowTransparency allow
        ]
    )
  end
end
