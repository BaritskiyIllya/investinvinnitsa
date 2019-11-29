class GisType < ApplicationRecord
  has_many :production_areas, foreign_key: :gis_type_name, primary_key: :name, inverse_of: :gis_type
  has_many :land_areas,       foreign_key: :gis_type_name, primary_key: :name, inverse_of: :gis_type
  has_many :office_areas,     foreign_key: :gis_type_name, primary_key: :name, inverse_of: :gis_type
  has_many :communal_areas,   foreign_key: :gis_type_name, primary_key: :name, inverse_of: :gis_type
  has_many :invest_projects,  foreign_key: :gis_type_name, primary_key: :name, inverse_of: :gis_type
end
