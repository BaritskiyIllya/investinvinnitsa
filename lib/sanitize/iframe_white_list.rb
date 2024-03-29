class IframeWhiteList
  def initialize(src, attributes)
    @src = src
    @attributes = attributes
  end

  def call(env)
    node      = env[:node]
    node_name = env[:node_name]

    # Don't continue if this node is already whitelisted or is not an element.
    return if env[:is_whitelisted] || !node.element?

    # Don't continue unless the node is an iframe.
    return unless node_name == 'iframe'

    # Verify that the video URL is actually a valid video URL.
    return unless node['src'] =~ @src

    # We're now certain that this is a valid embed, but we still need to run
    # it through a special Sanitize step to ensure that no unwanted elements or
    # attributes that don't belong in a YouTube embed can sneak in.
    Sanitize.clean_node!(node, elements: %w[iframe], attributes: { 'iframe' => @attributes })

    # Now that we're sure that this is a valid embed and that there are
    # no unwanted elements or attributes hidden inside it, we can tell Sanitize
    # to whitelist the current node.
    { node_whitelist: [node] }
  end
end
