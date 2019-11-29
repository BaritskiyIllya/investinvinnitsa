# require 'elasticsearch/model'

class Material < ApplicationRecord
  translates :title, :description, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en], attributes: %i[title description]

  include Elasticsearch::Model
  include ElasticCallback
  include EsHelper::Material
  include ElasticMyAnalyzer

  has_many :project_files, as: :fileable, dependent: :destroy
  accepts_nested_attributes_for :project_files, allow_destroy: true, reject_if: proc { |att| att['file'].blank? }

  has_many :project_images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :project_images, allow_destroy: true, reject_if: proc { |att| att['image'].blank? }

  validates :title_uk, presence: { message: I18n.t('blank') }, if: proc { |article| article.title_en.blank? }
  validates :title_en, presence: { message: I18n.t('blank') }, if: proc { |article| article.title_uk.blank? }
  validates :link, uniqueness: true, presence: { message: I18n.t('blank') }

  def link=(value)
    self[:link] = value.parameterize
  end

  def file_by_locale(locale)
    project_files.by_locale(locale.to_s).try :first
  end

  def image_by_locale(locale)
    project_images.by_locale(locale.to_s).try :first
  end

  settings ES_SETTING do
    mappings dynamic: 'true' do
      indexes :description_uk, type: 'text', analyzer: 'my_analyzer'
      indexes :description_en, type: 'text', analyzer: 'my_analyzer'
      indexes :title_uk,   type: 'text', analyzer: 'my_analyzer'
      indexes :title_en,   type: 'text', analyzer: 'my_analyzer'
    end
  end
end
