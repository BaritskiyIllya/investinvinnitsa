class CreateInfrastructureTypeRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :infra_type_relations do |t|
      t.integer :infrastructure_type_id
      t.references :infrasable, polymorphic: true
    end
  end
end
