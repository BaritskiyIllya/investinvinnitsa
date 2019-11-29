namespace :teams do
  task fill: :environment do
    Team.destroy_all
    Team.create(
      [{ id: 1, last_name_uk: 'Скальський', first_name_uk: 'Владислав', position_uk: 'заступник міського голови', phone: '+38(043)259-50-02', email: 'skalskyyv@vmr.gov.ua', department_id: '', on_main: true, trim: 1 },
       { id: 2, last_name_uk: 'Погосян', first_name_uk: 'Віталій', position_uk: 'директор департаменту економіки і інвестицій', phone: '+38(043)259-50-46', email: 'pogosian@vmr.gov.ua', department_id: '', on_main: true, trim: 2 },
       { id: 3, last_name_uk: 'Боцюн', first_name_uk: 'Андрій', position_uk: 'начальник управління інвестицій', phone: '', email: 'botsiun@vmr.gov.ua', department_id: '', on_main: true, trim: 3 },
       { id: 4, last_name_uk: 'Міронова', first_name_uk: 'Валерія', position_uk: 'начальник відділу', phone: '+38(043)259-51-44', email: 'mironova@vmr.gov.ua', department_id: 1, on_main: false, trim: 4 },
       { id: 5, last_name_uk: 'Ремешевська', first_name_uk: 'Ольга', position_uk: 'начальник відділу', phone: '+38(043)259-53-17', email: 'remeshevskaOI@vmr.gov.ua', department_id: 2, on_main: false, trim: 5 },
       { id: 6, last_name_uk: 'Шульженко', first_name_uk: "Дар'я", position_uk: 'заступник начальника відділу', phone: '+38(043)259-53-17', email: 'shulzhenkoDU@vmr.gov.ua', department_id: 2, on_main: false, trim: 6 },
       { id: 7, last_name_uk: 'Олінішевська', first_name_uk: 'Марина', position_uk: 'головний спеціаліст', phone: '+38(043)259-53-17', email: 'olinishevskaMO@vmr.gov.ua', department_id: 3, on_main: false, trim: 7 },
       { id: 8, last_name_uk: 'Гошовський', first_name_uk: 'Василь', position_uk: 'директор', phone: '+38(999)999-99-99', email: '', department_id: 4, on_main: true, trim: 8 },
       { id: 9, last_name_uk: 'Тудвасєв', first_name_uk: 'Валерій', position_uk: 'заступник директора', phone: '', email: '', department_id: 4, on_main: false, trim: 9 },
       { id: 10, last_name_uk: 'Казимова', first_name_uk: 'Альона', position_uk: 'маркетолог', phone: '', email: '', department_id: 4, on_main: false, trim: 10 },
       { id: 11, last_name_uk: 'Молдован', first_name_uk: 'Роман', position_uk: 'головний фахівець', phone: '', email: '', department_id: 4, on_main: false, trim: 11 }]
    )
    puts 'Upload finished successfully'
  end
end
