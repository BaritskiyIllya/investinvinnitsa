class InvestProject < Questionnaire
  translates :name, :short_description, :product, :market, :realization_term, :payback_period,
             :documentation, :description, :destination, :purpose, :current_use, :project_conditions, :resource_access,
             :character_assets, :workforce, :permission, :environment, :privilege, :other,
             fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en],
                      attributes: %i[name short_description product market realization_term payback_period documentation
                                     description destination purpose current_use project_conditions resource_access
                                     character_assets workforce permission environment privilege other]

  include Elasticsearch::Model
  include ElasticCallback
  include EsHelper::InvestProject
  include ElasticMyAnalyzer

  mount_base64_uploader :main_image, ImageUploader, file_name: ->(_u) { SecureRandom.hex }
  belongs_to :gis_type, foreign_key: 'gis_type_name', primary_key: 'name', inverse_of: :land_areas
  belongs_to :ownership
  belongs_to :investment_type

  has_one :questionnaire_file, as: :fileable, dependent: :destroy
  accepts_nested_attributes_for :questionnaire_file,
                                allow_destroy: true,
                                reject_if: proc { |att| att['file'].blank? }

  has_many :infra_type_relations, as: :infrasable, dependent: :destroy
  has_many :infrastructure_types, through: :infra_type_relations

  has_many :balancer_relations, as: :balanceable, dependent: :destroy
  has_many :balancers, through: :balancer_relations

  validates :short_description_uk, :invest_sum, :investment_type_id, :destination_uk, :area, :ownership_id, :purpose_uk,
            :current_use_uk, presence: { message: I18n.t('blank') }

  def inspection
    attributes.slice('product', 'market')
  end

  def invest_needs
    attributes.slice('invest_sum', 'investment_type_id', 'realization_term', 'payback_period', 'documentation')
  end

  def infrastructure
    attributes.slice('destination', 'area', 'ownership_id', 'purpose', 'current_use', 'project_conditions',
                     'hard_cover_road_distance', 'highway_distance', 'railway_distance', 'airport_distance', 'gas',
                     'electricity', 'water_supply')
  end

  def resources
    attributes.slice('resource_access', 'character_assets', 'workforce')
  end

  def regulatory
    attributes.slice('permission', 'environment', 'privilege')
  end

  settings ES_SETTING do
    mappings dynamic: 'true' do
      I18n.available_locales.each do |locale|
        loc = '_' + locale.to_s
        fields = %i[name short_description product market realization_term payback_period documentation
                    description destination purpose current_use project_conditions resource_access character_assets
                    workforce permission environment privilege other]
        fields.each do |field|
          indexes (field.to_s + loc).to_sym, type: 'text', analyzer: 'my_analyzer'
        end
      end
      indexes :invest_sum, type: 'text', analyzer: 'my_analyzer'
      indexes :area, type: 'text', analyzer: 'my_analyzer'
      indexes :hard_cover_road_distance, type: 'text', analyzer: 'my_analyzer'
      indexes :highway_distance, type: 'text', analyzer: 'my_analyzer'
      indexes :railway_distance, type: 'text', analyzer: 'my_analyzer'
      indexes :airport_distance, type: 'text', analyzer: 'my_analyzer'
      indexes :gas, type: 'text', analyzer: 'my_analyzer'
      indexes :electricity, type: 'text', analyzer: 'my_analyzer'
      indexes :water_supply, type: 'text', analyzer: 'my_analyzer'
    end
  end
end
