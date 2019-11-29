require 'elasticsearch/model'

class LandArea < Questionnaire
  translates :name, :area_name, :transfer_type, :classification, :configuration, :building_owner, :owner,
             :ethernet, :gas, :electricity, :water_supply, :drainager, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en],
                      attributes: %i[name area_name transfer_type classification configuration building_owner owner
                                     ethernet gas electricity water_supply drainager]

  include Elasticsearch::Model
  include ElasticCallback
  include EsHelper::LandArea
  include ElasticMyAnalyzer

  enum area_type: { greenfield: 1, brownfield: 2 }
  mount_base64_uploader :main_image, ImageUploader, file_name: ->(_u) { SecureRandom.hex }
  belongs_to :gis_type, foreign_key: 'gis_type_name', primary_key: 'name', inverse_of: :land_areas
  belongs_to :ownership

  has_one :questionnaire_file, as: :fileable, dependent: :destroy
  accepts_nested_attributes_for :questionnaire_file,
                                allow_destroy: true,
                                reject_if: proc { |att| att['file'].blank? }

  has_many :infra_type_relations, as: :infrasable, dependent: :destroy
  has_many :infrastructure_types, through: :infra_type_relations

  has_many :balancer_relations, as: :balanceable, dependent: :destroy
  has_many :balancers, through: :balancer_relations

  fields = %w[transfer_type area_name]
  fields.each do |field|
    validates :"#{field}_uk", :"#{field}_en", presence: { message: I18n.t('blank') }
  end

  validates :area_type, :total_area, :ownership_id, :cadastral_number, presence: { message: I18n.t('blank') }

  def general_information
    attributes.slice('area_name', 'area_type', 'total_area', 'ownership_id', 'configuration', 'building_owner',
                     'underground_engin', 'overhead_engin')
  end

  def legal_status
    attributes.slice('owner', 'cadastral_number', 'classification', 'transfer_type', 'sale', 'rent')
  end

  def tran_engin_infrastructure
    attributes.slice('state_road_distance', 'railway_distance', 'airport_distance', 'gas', 'electricity',
                     'water_supply', 'drainager', 'ethernet')
  end

  def person_info
    attributes.slice('name', 'phone', 'email')
  end

  settings ES_SETTING do
    mappings dynamic: 'true' do
      I18n.available_locales.each do |locale|
        loc = '_' + locale.to_s
        fields = %i[name area_name transfer_type classification configuration building_owner owner
                    ethernet gas electricity water_supply drainager]
        fields.each do |field|
          indexes (field.to_s + loc).to_sym, type: 'text', analyzer: 'my_analyzer'
        end
      end
      indexes :total_area, type: 'text', analyzer: 'my_analyzer'
      indexes :cadastral_number, type: 'text', analyzer: 'my_analyzer'
      indexes :rent, type: 'text', analyzer: 'my_analyzer'
      indexes :sale, type: 'text', analyzer: 'my_analyzer'
      indexes :state_road_distance, type: 'text', analyzer: 'my_analyzer'
      indexes :railway_distance, type: 'text', analyzer: 'my_analyzer'
      indexes :airport_distance, type: 'text', analyzer: 'my_analyzer'
      indexes :phone, type: 'text', analyzer: 'my_analyzer'
      indexes :email, type: 'text', analyzer: 'my_analyzer'
    end
  end
end
