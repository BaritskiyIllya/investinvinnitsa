# frozen_string_literal: true

module SeosHelper
  def seo_keywords(yield_keywords)
    yield_keywords || t(:keywords)
  end

  def seo_description(yield_desc)
    desc = yield_desc || t(:description).try(:html_safe).try(:truncate, 160)
    strip_tags(desc)
  end

  def seo_title(yield_title)
    yield_title || 'InvestPortal'
  end

  def seo_friendly_title(title, len=150)
    friendly_title(title, len).gsub(/["']/, '') if title.present?
  end
end
