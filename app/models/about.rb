class About < ApplicationRecord
  translates :title, :information, :description, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en], attributes: %i[title information description]

  has_many :project_images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :project_images, allow_destroy: true, reject_if: proc { |att| att['image'].blank? }

  validates :title_uk, :title_en, presence: { message: 'Поле не може бути пустим' }

  def image
    project_images.by_locale(I18n.locale).first || project_images.first
  end
end
