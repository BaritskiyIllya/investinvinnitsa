namespace :departments do
  task fill: :environment do
    Department.destroy_all
    Department.create(
      [{ id: 1, title_uk: 'Відділ підтримки та супроводу інвесторів', title_en: 'Department of support and support of investors', position: '1' },
       { id: 2, title_uk: 'Відділ інвестиційних проектів', title_en: 'Department of investment projects', position: '2' },
       { id: 3, title_uk: 'Відділ маркетингу і промоції', title_en: 'Marketing and Promotion Department', position: '3' },
       { id: 4, title_uk: 'КП «Вінницький муніципальний центр інновацій»', title_en: 'CE "Vinnytsia Municipal Innovation Center"', position: '4' }]
    )
    puts 'Upload finished successfully'
  end
end
