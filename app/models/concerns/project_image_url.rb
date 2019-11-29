module ProjectImageUrl
  extend ActiveSupport::Concern

  included do
    def image_by_locale
      project_images.find_by(locale: I18n.locale.to_s) || project_images.find_by(locale: I18n.default_locale.to_s)
    end

    def image_url
      image_by_locale.image.url
    end
  end
end
