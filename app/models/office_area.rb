require 'elasticsearch/model'

class OfficeArea < Questionnaire
  translates  :name, :transfer_type, :address, :owner, :gas, :electricity, :water_supply,
              :drainager, :heat_supply, :ethernet, :phone_sypply, :area_class, :ventilation, :fireproof, :guard,
              :parking, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en],
                      attributes: %i[name transfer_type address owner gas electricity water_supply drainager
                                     heat_supply ethernet phone_sypply area_class ventilation fireproof guard parking]

  include Elasticsearch::Model
  include ElasticCallback
  include EsHelper::OfficeArea
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

  belongs_to :gis_type, foreign_key: 'gis_type_name', primary_key: 'name', inverse_of: :office_areas

  fields = %w[address area_class transfer_type]
  fields.each do |field|
    validates :"#{field}_uk", :"#{field}_en", presence: { message: I18n.t('blank') }
  end

  validates :total_area, presence: { message: I18n.t('blank') }

  def date_info=(value)
    self[:date_info] = nil && return if value.blank?
    self[:date_info] = value.to_date
  end

  def gen_info
    attributes.slice('address', 'owner', 'edrpou_code', 'site')
  end

  def characteristic
    attributes.slice('total_area', 'area_class', 'ventilation', 'fireproof', 'guard', 'electricity',
                     'gas', 'water_supply', 'drainager', 'heat_supply', 'ethernet', 'phone_sypply')
  end

  def operational_costs
    attributes.slice('electricity_cost', 'gas_cost', 'water_cost', 'drainager_cost', 'heat_cost')
  end

  def infrastructure
    attributes.slice('city_center_distance', 'parking', 'transport_stop_distance')
  end

  def transfer_to_invest
    attributes.slice('transfer_type', 'rent', 'sale')
  end

  def person_info
    attributes.slice('name', 'phone', 'email', 'date_info')
  end

  settings ES_SETTING do
    mappings dynamic: 'true' do
      I18n.available_locales.each do |locale|
        loc = '_' + locale.to_s
        fields = %i[name transfer_type address owner gas electricity water_supply drainager heat_supply
                    ethernet phone_sypply area_class ventilation fireproof guard parking]
        fields.each do |field|
          indexes (field.to_s + loc).to_sym, type: 'text', analyzer: 'my_analyzer'
        end
      end
      indexes :edrpou_code, type: 'text', analyzer: 'my_analyzer'
      indexes :site, type: 'text', analyzer: 'my_analyzer'
      indexes :total_area, type: 'text', analyzer: 'my_analyzer'
      indexes :electricity_cost, type: 'text', analyzer: 'my_analyzer'
      indexes :gas_cost, type: 'text', analyzer: 'my_analyzer'
      indexes :water_cost, type: 'text', analyzer: 'my_analyzer'
      indexes :drainager_cost, type: 'text', analyzer: 'my_analyzer'
      indexes :heat_cost, type: 'text', analyzer: 'my_analyzer'
      indexes :city_center_distance, type: 'text', analyzer: 'my_analyzer'
      indexes :transport_stop_distance, type: 'text', analyzer: 'my_analyzer'
      indexes :phone, type: 'text', analyzer: 'my_analyzer'
      indexes :email, type: 'text', analyzer: 'my_analyzer'
      indexes :rent, type: 'text', analyzer: 'my_analyzer'
      indexes :sale, type: 'text', analyzer: 'my_analyzer'
    end
  end
end
