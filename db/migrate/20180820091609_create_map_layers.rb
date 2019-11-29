class CreateMapLayers < ActiveRecord::Migration[5.2]
  def change
    create_table :map_layers do |t|
      t.boolean :active, default: true
      t.boolean :layer, default: false
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        MapLayer.create_translation_table! title: :string
      end

      dir.down do
        MapLayer.drop_translation_table!
      end
    end

    MapLayer.create([
      { title_uk: 'Земельні ділянки greenfield', title_en: 'Ground sections greenfield' },
      { title_uk: 'Земельні ділянки brownfield', title_en: 'Ground sections brownfield' },
      { title_uk: 'Виробничі та офісні приміщення', title_en: 'Production and office premises' },
      { title_uk: 'Інвестиційні проекти та бізнес-кейси', title_en: 'Investment projects and business cases' },
      { title_uk: 'Транспортна інфраструктура міста - дороги, маршрути громадського транспорту тощо', title_en: 'Transport infrastructure of the city - roads, public transport routes, etc.' },
      { title_uk: 'Інженерна інфраструктура - мережі тепло-, водо-, електро- та газопостачання, водовідведення, вуличного освітлення тощо', title_en: 'Engineering infrastructure - networks of heat, water, electricity and gas supply, drainage, street lighting, etc.' },
      { title_uk: 'Шар з існуючими підприємствами міста - зв’язок з картою City4Business', title_en: 'A layer with existing city enterprises - contact with the map City4Business' },
      { title_uk: 'Шар зонування міста', title_en: 'A layer of zoning of the city' },
      { title_uk: 'Щар нарахування місцевого податку', title_en: 'A layer accrual of local tax' },
      { title_uk: 'Шар освітньої та наукової інфраструктури міста', title_en: 'A layer educational and scientific infrastructure of the city' }
    ])
  end
end
