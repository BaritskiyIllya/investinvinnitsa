require 'sanitize/iframe_white_list'
class Youtube < IframeWhiteList
  def initialize
    super(
        /\A(https?:)?\/\/(?:www\.)?youtube(?:-nocookie)?\.com\//,
        %w[
          allowfullscreen frameborder height src width scrolling
          webkitallowfullscreen mozallowfullscreen
          style title id name seamless
          allowtransparency hspace vspace marginheight
          marginwidth border
        ]
    )
  end
end
