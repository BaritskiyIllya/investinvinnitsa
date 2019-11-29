class PeriodEvent < ApplicationRecord
  translates :title, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en], attributes: %i[title]

  validates :title_uk, :title_en, presence: { message: I18n.t('blank') }
  has_many :events, dependent: :destroy
  accepts_nested_attributes_for :events, allow_destroy: true, reject_if: :all_blank

  scope :ordered, -> { order(position: :asc) }
  scope :for_tourism, -> { includes(:translations).includes(:events).ordered }
end
