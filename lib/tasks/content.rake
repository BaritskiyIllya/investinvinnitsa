namespace :content do
  task fill: :environment do
    Content.destroy_all
    Content.create(
      [{ id: 1, title_uk: 'Інтерактивна інвестиційна мапа', title_en: 'Interactive investment map', alias: 'map', description_uk: 'Інтерактивна карта висвітлює регіональні компетенції кожного баварського регіону. За допомогою всього лише одного клацання ви можете побачити індивідуальний підхід у секторі та можливі варіанти співпраці з бізнесом.', description_en: 'The interactive map highlights the regional competencies of each Bavarian region. With just one click you can see the individual sector focus and cooperation options for your business.' },
       { id: 2, title_uk: 'Про нас', title_en: 'About Us', alias: 'our_team', description_uk: 'Департамент економіки і інвестицій як структурний підрозділ Вінницької міської ради відповідає за економічну та інвестиційну сфери міста. Метою департаменту в межах інвестиційної політики є пошук, налагодження контактів та всебічна підтримка та супровід інвесторів. Крім того, департамент розробляє та впроваджує засади інвестиційної політики Вінниці, надає підтримку у реалізації інвестиційних проектів та ініціює створення інноваційної інфраструктури міста.', description_en: 'The Department of Economics and Investments as a structural subdivision of the Vinnytsia City Council is responsible for the economic and investment spheres of the city. The purpose of the department within the investment policy is to search, establish contacts and provide comprehensive support and support to investors. In addition, the department develops and implements the principles of the investment policy of Vinnytsia, provides support for the implementation of investment projects and initiates the creation of an innovative infrastructure of the city.' }]
    )
    puts 'Upload finished successfully'
  end

  task tourism: :environment do
    Content.create([
      {
        id: 3,
        title_uk: 'Історичний центр',
        title_en: 'Historical center',
        description_uk: 'Вінниця — історичний центр Поділля з багатою історією, традиціями, культурою та великою кількістю музеїв. Вінниця є інтеркультурним та толерантним містом, де представлені храми всіх основних релігійних конфесій України: християнських (православні, католики, греко-католики, протестанти), ісламських та юдейських.',
        description_en: 'Vinnitsa is a historical center of Podillya with a rich history, traditions, culture and a large number of museums. Vinnitsa is an intercultural and tolerant city where the churches of all the main religious denominations of Ukraine are presented: Christian (Orthodox, Catholic, Greek Catholic, Protestant), Islamic and Jewish.',
        alias: 'tourism_historical'
      },
      {
        id: 4,
        title_uk: 'Цікаві факти',
        title_en: 'Interesting Facts',
        description_uk: 'У Вінниці розроблено мобільний туристичний додаток «Вільна мапа», що допомагатиме гостям міста більше дізнаватись про його історію',
        description_en: 'Vinnytsya has developed a mobile tourist application "Free Map", which will help the guests of the city to learn more about its history.',
        alias: 'tourism_facts'
      },
      {
        id: 5,
        title_uk: 'Корисна інформація',
        title_en: 'Useful Information',
        description_uk: 'Середній чек у закладах харчування',
        description_en: 'Average check at food establishments',
        alias: 'tourism_useful'
      }
    ])
  end

  task main_page: :environment do
    Content.create([
       {
          id: 6,
          title_uk: 'Місто, яке надихає кожного',
          title_en: 'City that inspires everyone',
          description_uk: 'Наше місто відкрите до змін. Поєднаємо мрії та можливості. Створимо майбутнє разом!',
          description_en: 'Our city is open to change. Combine dreams and opportunities. Let\'s create the future together!',
          alias: 'slogan'
       },
       {
           id: 7,
           title_uk: 'Чому Вінниця',
           title_en: 'Why Vinnytsia',
           description_uk: '',
           description_en: '',
           alias: 'why_vin'
       },
       {
           id: 8,
           title_uk: '№1 в дослідженні «Індекс задоволеності якістю сфер та послуг»',
           title_en: '№1 in «Index of Quality Satisfaction of Spheres and Services»',
           description_uk: '',
           description_en: '',
           alias: 'benefit_index'
       },
       {
           id: 9,
           title_uk: 'Оцінка «invA+» - «Висока інвестиційна привабливість»',
           title_en: '"invA +" score - "High investment attractiveness"',
           description_uk: '',
           description_en: '',
           alias: 'benefit_rating'
       },
       {
           id: 10,
           title_uk: '1 місце у рейтингу Regional Doing Business',
           title_en: '1 place in Regional Doing Business rating',
           description_uk: '',
           description_en: '',
           alias: 'benefit_place'
       },
       {
           id: 11,
           title_uk: '1 місце у Рейтингу прозорості інвестиційного сектору',
           title_en: '1 place in Rating of transparency of the investment sector',
           description_uk: '',
           description_en: '',
           alias: 'benefit_it'
       },
       {
           id: 12,
           title_uk: 'Подивитись відео',
           title_en: 'Watch video',
           description_uk: '',
           description_en: '',
           alias: 'watch_video'
       }
    ])
  end
end
