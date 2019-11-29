require 'elasticsearch/model'

class Article < ApplicationRecord
  translates :title, :short_description, :description, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en], attributes: %i[title short_description description]

  include Elasticsearch::Model
  include ElasticCallback
  include EsHelper::Article
  include ElasticMyAnalyzer

  has_many :project_images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :project_images, allow_destroy: true, reject_if: proc { |att| att['image'].blank? }

  has_many :articles_tags, dependent: :delete_all
  has_many :tags, through: :articles_tags, class_name: 'Tag'

  validates :title_uk, presence: { message: I18n.t('blank') }, if: proc { |article| article.title_en.blank? }
  validates :title_en, presence: { message: I18n.t('blank') }, if: proc { |article| article.title_uk.blank? }

  scope :publication_order, -> { order('publication_time desc') }
  scope :published, -> { where(published: true).publication_order }
  scope :published_now, lambda {
    published.where(
      'publication_time < :time AND (end_publication_time is NULL OR end_publication_time > :time)',
      time: Time.current
    )
  }

  def image
    project_images.by_locale(I18n.locale).first || project_images.first
  end

  settings ES_SETTING do
    mappings dynamic: 'true' do
      indexes :description_uk, type: 'text', analyzer: 'my_analyzer'
      indexes :description_en, type: 'text', analyzer: 'my_analyzer'
      indexes :short_description_uk, type: 'text', analyzer: 'my_analyzer'
      indexes :short_description_en, type: 'text', analyzer: 'my_analyzer'
      indexes :title_uk,   type: 'text', analyzer: 'my_analyzer'
      indexes :title_en,   type: 'text', analyzer: 'my_analyzer'
      indexes :published, type: 'boolean'
    end
  end
end
