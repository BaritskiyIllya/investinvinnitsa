require 'elasticsearch/model'

class ProductionArea < Questionnaire
  translates  :name, :transfer_type, :address, :owner, :gas, :electricity, :water_supply,
              :drainager, :central_heat_supply, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en],
                      attributes: %i[name transfer_type address owner gas electricity water_supply drainager
                                     central_heat_supply]

  include Elasticsearch::Model
  include ElasticCallback
  include EsHelper::ProductionArea
  include ElasticMyAnalyzer

  mount_base64_uploader :main_image, ImageUploader, file_name: ->(_u) { SecureRandom.hex }

  has_one :questionnaire_file, as: :fileable, dependent: :destroy
  accepts_nested_attributes_for :questionnaire_file,
                                allow_destroy: true,
                                reject_if: proc { |att| att['file'].blank? }

  has_many :infra_type_relations, as: :infrasable, dependent: :destroy
  has_many :infrastructure_types, through: :infra_type_relations

  has_many :balancer_relations, as: :balanceable, dependent: :destroy
  has_many :balancers, through: :balancer_relations

  belongs_to :gis_type, foreign_key: 'gis_type_name', primary_key: 'name', inverse_of: :production_areas
  belongs_to :ownership

  uk_fields = %w[address transfer_type]
  uk_fields.each do |field|
    validates :"#{field}_uk", presence: { message: I18n.t('blank') }
  end

  validates :production_area, :ownership_id, presence: { message: I18n.t('blank') }

  def date_info=(value)
    self[:date_info] = nil && return if value.blank?
    self[:date_info] = value.to_date
  end

  def main_information
    attributes.slice('address', 'owner', 'ownership_id', 'edrpou_code', 'site')
  end

  def tracks
    attributes.slice('railway_track', 'railway_distance', 'trucks_road', 'state_road_distance', 'airport_distance')
  end

  def characteristics
    attributes.slice('total_area', 'building_year', 'free_floors_count', 'free_floors', 'production_area', 'additional')
  end

  def area_support
    attributes.slice('gas', 'electricity', 'water_supply', 'drainager', 'central_heat_supply')
  end

  def person_info
    attributes.slice('name', 'phone', 'email')
  end

  def invest_conditions
    attributes.slice('transfer_type', 'rent_year', 'sale', 'date_info')
  end

  settings ES_SETTING do
    mappings dynamic: 'true' do
      I18n.available_locales.each do |locale|
        loc = '_' + locale.to_s
        fields = %i[name transfer_type address owner gas electricity water_supply drainager
                    central_heat_supply]
        fields.each do |field|
          indexes (field.to_s + loc).to_sym, type: 'text', analyzer: 'my_analyzer'
        end
      end
      indexes :edrpou_code, type: 'text', analyzer: 'my_analyzer'
      indexes :site, type: 'text', analyzer: 'my_analyzer'
      indexes :railway_distance, type: 'text', analyzer: 'my_analyzer'
      indexes :state_road_distance, type: 'text', analyzer: 'my_analyzer'
      indexes :airport_distance, type: 'text', analyzer: 'my_analyzer'
      indexes :total_area, type: 'text', analyzer: 'my_analyzer'
      indexes :building_year, type: 'text', analyzer: 'my_analyzer'
      indexes :free_floors_count, type: 'text', analyzer: 'my_analyzer'
      indexes :free_floors, type: 'text', analyzer: 'my_analyzer'
      indexes :production_area, type: 'text', analyzer: 'my_analyzer'
      indexes :additional, type: 'text', analyzer: 'my_analyzer'
      indexes :phone, type: 'text', analyzer: 'my_analyzer'
      indexes :email, type: 'text', analyzer: 'my_analyzer'
      indexes :rent_year, type: 'text', analyzer: 'my_analyzer'
      indexes :sale, type: 'text', analyzer: 'my_analyzer'
    end
  end
end
