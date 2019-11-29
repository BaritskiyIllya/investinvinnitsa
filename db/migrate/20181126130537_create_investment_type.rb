class CreateInvestmentType < ActiveRecord::Migration[5.2]
  def up
    create_table :investment_types do |t|
      t.timestamps
    end

    InvestmentType.create_translation_table! name: :string
    InvestmentType.create([
                              {name_uk: 'Акціонерний капітал', name_en: 'Join-stock'},
                              {name_uk: 'Венчурний капітал', name_en: 'Venture capital'},
                              {name_uk: 'Кредитні кошти', name_en: 'Loan funds'}
                          ])
  end

  def down
    drop_table :investment_types if table_exists? :investment_types
    drop_table :investment_type_translations if table_exists? :investment_type_translations
  end
end
