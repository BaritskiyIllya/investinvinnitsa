class Project < ApplicationRecord
  include ProjectImageUrl

  translates :title, :description, :short_description, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en], attributes: %i[title description short_description]

  has_many :project_images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :project_images, allow_destroy: true, reject_if: proc { |att| att['image'].blank? }

  validates :title_uk, :title_en, presence: { message: I18n.t('blank') }
  validate :blank_images

  scope :by_locale, ->(locale) { where(locale: locale) }

  def image
    project_images.by_locale(I18n.locale).first || project_images.first
  end

  def blank_images
    errors.add(:image, 'Поле не може бути пустим') if project_images.blank?
  end
end
