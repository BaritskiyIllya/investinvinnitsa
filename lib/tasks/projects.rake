namespace :projects do
  task fill: :environment do
    Project.destroy_all
    Project.create(
      [{ id: 1, title_uk: 'Вінницький кластер холодильного машинобудування', title_en: 'Vinnitsa cluster of refrigeration engineering', alias: 'refrigeration_engineering' },
       { id: 2, title_uk: 'Аеропорт Вінниця', title_en: 'Airport Vinnitsa', alias: 'airport_vinnitsa' },
       { id: 3, title_uk: 'Будівництво шляхопроводу', title_en: 'Construction of overpass', alias: 'overpass_construction' },
       { id: 4, title_uk: 'Вінницький інноваційно-технологічний парк', title_en: 'Vinnytsia Innovation and Technology Park', alias: 'innovation_technology_park' },
       { id: 5, title_uk: 'Вінницький індустріальний парк', title_en: 'Vinnytsya industrial park', alias: 'industrial_park' }]
    )
    puts 'Upload finished successfully'
  end
end
