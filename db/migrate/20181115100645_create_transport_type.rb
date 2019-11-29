class CreateTransportType < ActiveRecord::Migration[5.2]
  def up
    create_table :transport_types do |t|
      t.timestamps
    end

    TransportType.create_translation_table! name: :string

    data = [
      {name_uk: 'Трамвай', name_en: 'Tramway'},
      {name_uk: 'Тролейбус', name_en: 'Trolleybus'},
      {name_uk: 'Автобус', name_en: 'Bus'},
      {name_uk: 'Маршрутне таксі', name_en: 'Taxi'}
    ]
    TransportType.create(data)
  end

  def down
    drop_table :transport_types
    TransportType.drop_translation_table!
  end
end
