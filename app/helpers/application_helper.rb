module ApplicationHelper
  def cabinet_by_role
    if current_user.has_any_role?(:admin)
      admin_root_path
    elsif current_user.has_any_role?(:questionnaire, :moderator)
      cabinet_root_path
    else
      root_path
    end
  end

  def format_date(date, delimiter='.')
    date.strftime("%d#{delimiter}%m#{delimiter}%Y") if date.present?
  end

  def format_date_time(date_time, delimiter='.')
    date_time.strftime("%d#{delimiter}%m#{delimiter}%Y - %H:%M") if date_time.present?
  end

  def implement_url(link)
    id_video = link.split('v=')[1] || 'not_valid_video'
    'https://www.youtube.com/embed/' + id_video + '?autoplay=0&loop=1&playlist=' + id_video + '&mute=1'
  end

  def locale_link(a_link, locale)
    link = a_link.sub(%r{^(\/ua\/?|\/en\/?|\/)}, '')
    if ['/', ''].include?(link)
      return locale.to_s == 'uk' ? '/' : '/en'
    end
    locale.eql?(:uk) ? '/' + link : '/' + locale.to_s + '/' + link.to_s
  end

  def true_false(status)
    return '-' if status.nil?
    status ? I18n.t('active_true') : I18n.t('active_false')
  end

  def sanitazed_text(text)
    require 'require_all'
    require_all 'lib/sanitize/networks/*.rb'

    Sanitize.fragment(text, Sanitize::Config.merge(Sanitize::Config::RELAXED,
                            attributes: {
                                'a' => Sanitize::Config::RELAXED[:attributes]['a'] + %w[target title style],
                                'img' => Sanitize::Config::RELAXED[:attributes]['img'] + %w[title style]
                            },
                            transformers: [Youtube.new, Facebook.new, Instagram.new]
                        )).html_safe
  end

  def balancer_names(objs)
    objs.pluck(:name).join(', ')
  end

  def review_name(review)
    "#{review.first_name} #{review.last_name}"
  end

  def text_briefly(text, len=525)
    strip_tags(text.to_s).truncate(len, separator: ' ', omission: '...')
  end

  def with_video?
    current_page?(root_path) || current_page?('/uk') || current_page?('/en')
  end

  def next_page
    [0, 1].include?(params[:page].to_i) ? 2 : params[:page].to_i + 1
  end

  def symbol_code_butcher(string)
    CGI.unescapeHTML(string.to_str)
  end

  def friendly_title(str, lenght=30)
    strip_html_tags(str).truncate(lenght) if str.present?
  end

  def strip_html_tags(string)
    ActionView::Base.full_sanitizer.sanitize(string)
  end

  def filesize(file)
    number_to_human_size(file.file.size)
  end
end
