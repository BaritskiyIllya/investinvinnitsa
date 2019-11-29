class MultySearch
  MODELS_TO_SEARCH = [Review, BlockMaterial, Material, Article, LandArea, OfficeArea, ProductionArea,
                      InvestProject].freeze
  def initialize; end

  def search(search_word)
    run_elastic(search_word)
  end

  private

  def run_elastic(search_word)
    results = []
    MODELS_TO_SEARCH.each do |model|
      query = send(model.to_s.underscore + '_query', search_word)
      results << Elasticsearch::Model.search(query, model).records.to_a
    end
    results.flatten.compact
  end

  def production_area_query(query)
    {
      query: {
        bool: {
          must: {
            multi_match: {
              query: query,
              fields: %i[name_uk transfer_type_uk address_uk owner_uk gas_uk electricity_uk water_supply_uk
                         drainager_uk central_heat_supply_uk name_en transfer_type_en address_en owner_en
                         electricity_en water_supply_en drainager_en central_heat_supply_en edrpou_code site gas_en
                         state_road_distance airport_distance total_area building_year free_floors_count free_floors
                         production_area additional phone email rent_year sale railway_distance]
            }
          }
        }
      }
    }
  end

  def office_area_query(query)
    {
      query: {
        bool: {
          must: {
            multi_match: {
              query: query,
              fields: %i[name_uk transfer_type_uk address_uk owner_uk gas_uk electricity_uk water_supply_uk drainager_uk
                         heat_supply_uk ethernet_uk phone_sypply_uk area_class_uk ventilation_uk fireproof_uk guard_uk
                         parking_uk name_en transfer_type_en address_en owner_en gas_en electricity_en water_supply_en
                         drainager_en heat_supply_en ethernet_en phone_sypply_en area_class_en ventilation_en sale
                         guard_en parking_en edrpou_code site total_area electricity_cost gas_cost water_cost rent
                         heat_cost city_center_distance transport_stop_distance phone email fireproof_en drainager_cost]
            }
          }
        }
      }
    }
  end

  def land_area_query(query)
    {
      query: {
        bool: {
          must: {
            multi_match: {
              query: query,
              fields: %i[name_uk area_name_uk transfer_type_uk classification_uk configuration_uk building_owner_uk
                         ethernet_uk gas_uk electricity_uk water_supply_uk drainager_uk name_en area_name_en owner_uk
                         transfer_type_en classification_en configuration_en building_owner_en owner_en
                         ethernet_en gas_en electricity_en water_supply_en drainager_en total_area cadastral_number
                         rent sale state_road_distance railway_distance airport_distance phone email]
            }
          }
        }
      }
    }
  end

  def article_query(query)
    {
      query: {
        bool: {
          must: {
            multi_match: {
              query: query,
              fields: %i[short_description_en short_description_uk description_en description_uk title_uk title_en]
            }
          }
          # filter: [{ term: { published: true } }]
        }
      }
    }
  end

  def review_query(query)
    {
      query: {
        bool: {
          must: {
            multi_match: {
              query: query,
              fields: %i[description_uk description_en last_name_uk last_name_en first_name_uk first_name_en middle_name_uk
                         middle_name_en position_uk position_en]
            }
          }
        }
      }
    }
  end

  def block_material_query(query)
    {
      query: {
        nested: {
          path: :block_material_contents,
          query: {
            bool: {
              must: {
                multi_match: {
                  query: query,
                  fields: %i[block_material_contents.title_uk block_material_contents.title_en
                             block_material_contents.description_uk block_material_contents.description_en]
                }
              }
            }
          }
        }
      }
    }
  end

  def material_query(query)
    {
      query: {
        bool: {
          must: {
            multi_match: { query: query, fields: %i[description_en description_uk title_uk title_en] }
          }
        }
      }
    }
  end

  def invest_project_query(query)
    {
      query: {
        bool: {
          must: {
            multi_match: {
              query: query,
              fields: %i[name_en short_description_en product market_en realization_term_en payback_period_en
                         documentation_en description_en destination_en purpose_en current_use_en project_conditions_en
                         resource_access_en character_assets_en workforce_en permission_en environment_en privilege_en
                         other_en name_uk short_description_uk product market_uk realization_term_uk payback_period_uk
                         documentation_uk description_uk destination_uk purpose_uk current_use_uk project_conditions_uk
                         resource_access_uk character_assets_uk workforce_uk permission_uk environment_uk privilege_uk
                         other_uk invest_sum area hard_cover_road_distance highway_distance railway_distance
                         airport_distance gas electricity water_supply]
            }
          }
        }
      }
    }
  end
end
