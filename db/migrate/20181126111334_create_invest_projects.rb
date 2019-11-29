class CreateInvestProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :invest_projects do |t|
      t.string  :invest_sum #Сума інвестицій
      t.integer :investment_type_id #тип інвестицій
      t.integer :area #Площа у квадратних метрах
      t.integer :ownership_id #право власності

      t.string :hard_cover_road_distance, precision: 10, scale: 2 #Відстань до доріг з твердим покриттям
      t.string :highway_distance, precision: 10, scale: 2 #Відстань до автомагістралі
      t.string :railway_distance, precision: 10, scale: 2 #Відстань до залізничної дороги
      t.string :airport_distance, precision: 10, scale: 2 #Відстань до аеропорту

      t.string :gas, precision: 10, scale: 2 #Відстань до діючого газопроводу
      t.string :electricity, precision: 10, scale: 2 #Відстань до діючої лінії електропередач
      t.string :water_supply, precision: 10, scale: 2 #Відстань до можливого місця підключення до діючого водопроводу

      t.string  :main_image
      t.string  :gis_type_name
      t.integer :user_id
      t.integer :state, limit: 2,  default: 0
      t.integer :map_layer_id

      t.timestamps
    end

    reversible do |dir|
      dir.up do
      InvestProject.create_translation_table! name: :string, #назва проекту
                                              short_description: :string, #опис проекту
                                              product: :string, #продукт/послуга
                                              market: :string, #аналіз ринку
                                              realization_term: :string, #Термін реалізації проекту
                                              payback_period: :string, # Період окупності
                                              documentation: :string, #Очікувана готовність проектної документації
                                              description: :string, #Детальний опис
                                              destination: :string, #Розміщення
                                              purpose: :string, #Цільове призначення
                                              current_use: :string, #поточне використання
                                              project_conditions: :string, #проектні умови
                                              resource_access: :string, #Доступ до ресурсів та послуг
                                              character_assets: :string, #Характеристика існуючих активів
                                              workforce: :string, #Наявність та кваліфікація  робочої сили
                                              permission: :string, #Обов’язкові дозволи та ліцензії
                                              environment: :string, #Екологічні обмеження та вимоги
                                              privilege: :string, #Існуючі привілеї та стимули
                                              other: :string #Інше
      end

      dir.down do
        InvestProject.drop_translation_table!
      end
    end
  end
end
