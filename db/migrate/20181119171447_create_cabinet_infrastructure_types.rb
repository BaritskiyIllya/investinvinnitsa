class CreateCabinetInfrastructureTypes < ActiveRecord::Migration[5.2]
  def up
    create_table :infrastructure_types do |t|
      t.timestamps
    end

    InfrastructureType.create_translation_table! name: :string

    data = [
        {name_uk: 'Газопостачання', name_en: 'Gas supply'},
        {name_uk: 'Електропостачання', name_en: 'Electricity supply'},
        {name_uk: 'Водопостачання', name_en: 'Water supply'},
        {name_uk: 'Водовідведення', name_en: 'Drainage'}
    ]
    InfrastructureType.create(data)
  end

  def down
    drop_table :infrastructure_types
    InfrastructureType.drop_translation_table!
  end
end
