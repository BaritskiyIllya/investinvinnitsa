class CommunalArea < Questionnaire
  translates :field_category, :room, :object_name, :object_type, :address, fallbacks_for_empty_translations: true
  globalize_accessors locales: %i[uk en],
                      attributes: %i[field_category room object_name object_type address]

  mount_base64_uploader :main_image, ImageUploader, file_name: ->(_u) { SecureRandom.hex }
  belongs_to :gis_type, foreign_key: 'gis_type_name', primary_key: 'name', optional: true, inverse_of: :communal_areas

  has_one :questionnaire_file, as: :fileable, dependent: :destroy
  accepts_nested_attributes_for :questionnaire_file,
                                allow_destroy: true,
                                reject_if: proc { |att| att['file'].blank? }

  has_many :balancer_relations, as: :balanceable, dependent: :destroy
  has_many :balancers, through: :balancer_relations
  belongs_to :land_category
  belongs_to :balance_holder
  belongs_to :communal_branch

  scope :by_name, ->(query) {
                    with_translations(:uk)
                      .where('LOWER(communal_area_translations.object_name) LIKE ?', "%#{query.downcase}%")
                  }
  scope :by_status, ->(query) { where(state: query) }
  scope :by_map_layer, ->(query) { where(map_layer_id: query) }
  scope :by_balancer, ->(query) { joins(:balancers).where('balancer_relations.balancer_id = ?', query) }

  def general_information
    attributes.except('id', 'user_id', 'gis_type_name', 'state', 'map_layer_id',
                      'created_at', 'updated_at', 'main_image')
  end

  def api_attributes
    attributes.except('id', 'user_id', 'gis_type_name', 'state', 'map_layer_id',
                      'created_at', 'updated_at')
  end

  def education_layer?
    map_layer_id.to_i.eql? 10
  end
end
