class BlockMaterialContent < ApplicationRecord
  translates :title, :description, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en], attributes: %i[title description]

  mount_base64_uploader :image, ImageUploader, file_name: ->(_u) { SecureRandom.hex }

  has_many :material_content_columns,
           class_name: 'MaterialContentColumn',
           foreign_key: :content_id,
           dependent: :destroy,
           inverse_of: :block_material_content
  accepts_nested_attributes_for :material_content_columns, allow_destroy: true
  belongs_to :block_material

  validates :title_uk, :description_uk, :image, presence: { message: I18n.t('blank') }

  validate :member_limit
  def member_limit
    errors.add(:base, 'Кількість колонок має бути не більше 4') if material_content_columns.size > 4
  end
end
