class Tag < ApplicationRecord
  translates :title, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en], attributes: %i[title]

  has_many :articles_tags, dependent: :delete_all
  has_many :articles, through: :articles_tags, class_name: 'Article'

  before_validation :set_link, on: :create

  validates :alias, uniqueness: { message: 'Не допустима назва тегу' }
  validates :title_uk, presence: true, if: proc { |article| article.title_en.blank? },
                       uniqueness: { message: 'Такий тег уже був створений раніше' }
  validates :title_en, presence: true, if: proc { |article| article.title_uk.blank? },
                       uniqueness: { message: 'Такий тег уже був створений раніше' }

  private

  def set_link
    self.alias = title.to_slug.transliterate(:ukrainian).to_s.parameterize
  end
end
