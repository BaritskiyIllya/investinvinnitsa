namespace :advantages do
  task fill: :environment do
    Advantage.destroy_all
    Advantage.create(
      [{ id: 1, title_uk: 'Вигідне географічне положення', title_en: 'Favorable geographical position', alias: 'geographical_position' },
       { id: 2, title_uk: 'Комфортне місто для проживання', title_en: 'Comfortable city for living', alias: 'comfortable_city' },
       { id: 3, title_uk: 'Визначний кадровий потенціал', title_en: 'Significant personnel potential', alias: 'human_potential' },
       { id: 4, title_uk: 'Розвинений освітній сектор', title_en: 'Developed educational sector', alias: 'educational_sector' },
       { id: 5, title_uk: 'Інвестиціно-інноваційна інфраструктура', title_en: 'Investment investment and innovation infrastructure', alias: 'innovation_infrastructure' },
       { id: 6, title_uk: 'Сприятливий інвестиційний клімат', title_en: 'Favorable investment climate', alias: 'investment_climate' },
       { id: 7, title_uk: 'Надійний бізнес-партнер', title_en: 'Reliable business partner', alias: 'reliable_business_partner' }]
    )
    puts 'Upload finished successfully'
  end
end
