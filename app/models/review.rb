require 'elasticsearch/model'

class Review < ApplicationRecord
  translates :last_name, :first_name, :middle_name, :position, :description, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en], attributes: %i[last_name first_name middle_name position description]
  mount_base64_uploader :image, ImageUploader, file_name: ->(_u) { SecureRandom.hex }

  include Elasticsearch::Model
  include ElasticCallback
  include Elasticsearch::Model::Globalize::MultipleFields
  include EsHelper::Review
  include ElasticMyAnalyzer

  before_destroy :remove_image

  def remove_image
    image.remove! if image.present?
  end

  def full_name
    "#{last_name} #{first_name}"
  end

  settings ES_SETTING do
    mappings dynamic: 'true' do
      indexes :description_uk, type: 'text', analyzer: 'my_analyzer'
      indexes :description_en, type: 'text', analyzer: 'my_analyzer'
      indexes :last_name_uk,   type: 'text', analyzer: 'my_analyzer'
      indexes :last_name_en,   type: 'text', analyzer: 'my_analyzer'
      indexes :first_name_uk,  type: 'text', analyzer: 'my_analyzer'
      indexes :first_name_en,  type: 'text', analyzer: 'my_analyzer'
      indexes :middle_name_uk, type: 'text', analyzer: 'my_analyzer'
      indexes :middle_name_en, type: 'text', analyzer: 'my_analyzer'
      indexes :position_uk,    type: 'text', analyzer: 'my_analyzer'
      indexes :position_en,    type: 'text', analyzer: 'my_analyzer'
    end
  end
end
