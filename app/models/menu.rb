class Menu < ApplicationRecord
  translates :title, :tag_alt, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en], attributes: %i[title tag_alt]

  belongs_to :menu_group, foreign_key: 'menu_group_id', primary_key: 'group_key', inverse_of: :menus
  has_many :children, class_name: 'Menu', foreign_key: 'parent_id', inverse_of: :children
  belongs_to :parent, class_name: 'Menu', optional: true

  validates :title_uk, :tag_alt_uk, :position, presence: { message: I18n.t('blank') }

  scope :active, -> { where(active: true) }
  scope :parent_menu, -> { where(parent: 0) }
  scope :top_bar, -> { where(menu_group_id: 1) }

  def parent=(value)
    self[:parent] = 0 && return if value.blank?
    self[:parent] = value
  end

  def link=(value)
    self[:link] = value.delete('/')
  end
end
