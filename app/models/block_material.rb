require 'elasticsearch/model'

class BlockMaterial < ApplicationRecord
  include Elasticsearch::Model
  include ElasticCallback
  include EsHelper::BlockMaterial
  include ElasticMyAnalyzer

  has_many :block_material_contents, dependent: :destroy
  accepts_nested_attributes_for :block_material_contents, allow_destroy: true

  validates :link, uniqueness: true, presence: { message: I18n.t('blank') }

  def link=(value)
    self[:link] = value.parameterize
  end

  settings ES_SETTING do
    mappings dynamic: 'true' do
      indexes :block_material_contents, type: 'nested' do
        indexes :title_en, type: 'text', analyzer: 'my_analyzer'
        indexes :title_uk, type: 'text', analyzer: 'my_analyzer'
        indexes :description_en, type: 'text', analyzer: 'my_analyzer'
        indexes :description_uk, type: 'text', analyzer: 'my_analyzer'
      end
    end
  end
end
