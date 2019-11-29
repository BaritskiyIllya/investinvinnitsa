class MaterialContentColumn < ApplicationRecord
  translates :title, :value, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en], attributes: %i[title value]

  belongs_to :block_material_content, inverse_of: :material_content_columns, foreign_key: :content_id

  validates :title_uk, :value_uk, presence: { message: I18n.t('blank') }
end
