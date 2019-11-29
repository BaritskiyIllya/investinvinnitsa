namespace :abouts do
  task fill: :environment do
    About.delete_all
    About.create([
                   {
                     name: 'Розділ "Чому Вінниця" (1 блок "Місто - комфортне для життя")',
                     title_uk: 'Місто - комфортне для життя',
                     title_en: 'The city is comfortable for life',
                     information_uk: '<div style="text-align: right;"><span style="color:#b4000f;font-weight:600;">113,2 км&nbsp;</span>- площа міста</div>

<div style="text-align: right;"><span style="color:#b4000f;font-weight:600;">370 тис. осіб</span> - населенння міста</div>

<div style="text-align: right;"><span style="color:#b4000f;font-weight:600;">1363 рік</span> - перша письмова згадка про Вінницю</div>',
                     information_en: '<div style="text-align: right;"><span style="color:#b4000f;font-weight:600;">113,2 km</span> - city ​​square</div>

<div style="text-align: right;"><span style="color:#b4000f;font-weight:600;">370 k. people</span> - city ​​population</div>

<div style="text-align: right;"><span style="color:#b4000f;font-weight:600;">1363 year</span> - the first written mention of Vinnytsia</div>',
                     description_uk: '<div>Вінницю чотири рази визнано найкомфортнішим містом для проживання, вперше, у 2013 р. журнал &ldquo;Фокус&rdquo; оголосив Вінницю лідером рейтингу &ldquo;Найкращі міста для життя&ldquo;. В 2015, 2016 і 2017 роках Вінниця очолила подібний рейтинг від соціологічної групи &ldquo;Рейтинг&rdquo;, за результатами...</div>',
                     description_en: '<div>Vinnytsia was recognized four times as the most comfortable city for living, for the first time, in 2013, the Focus magazine declared Vinnytsia the leader of the rating &quot;The best cities for life&quot;. In 2015, 2016 and 2017, Vinnytsia headed a similar rating from the &quot;Rating&quot; sociological group, according to the results...</div>',
                     alias: 'comfortable_city'
                   },
                   {
                     name: 'Розділ "Чому Вінниця" (2 блок "Визначний кадровий потенціал")',
                     title_uk: 'Визначний кадровий потенціал',
                     title_en: 'Significant personnel potential',
                     information_uk: '<div><span style="color:#b4000f;font-weight:600;">104 190</span> - кадровий потенціал міста (віком від 15 до 35 років), з яких 54% жінок, та 46% чоловіків</div>',
                     information_en: '<div><span style="color:#b4000f;font-weight:600;">104 190&nbsp;</span>- the personnel potential of the city (aged 15 to 35), of which 54% are women, and 46% are men</div>',
                     description_uk: '<div><span style="color:#b4000f;font-weight:600;">Більше 45 тисяч</span> студентів здобувають освіту у навчальних закладах м. Вінниці</div>

<div>&nbsp;</div>

<div><span style="color:#b4000f;font-weight:600;">11</span> навчальних закладів I-II рівнів акредитації</div>

<div>&nbsp;</div>

<div><span style="color:#b4000f;font-weight:600;">14</span> навчальних закладів найвищого рівня акредитації,</div>

<div><span style="color:#b4000f;font-weight:600;">4</span> з яких мають статус націіонального університету, та</div>

<div><span style="color:#b4000f;font-weight:600;">1</span> який має статус державного університету.</div>

<div>&nbsp;</div>

<div><span style="color:#b4000f;font-weight:600;">9</span> професійно &ndash; технічних навчальних закладів</div>',
                     description_en: '<div><span style="color:#b4000f;font-weight:600;">More than 45</span> thousand students obtain education in educational institutions of the city of Vinnytsia</div>

<div>&nbsp;</div>

<div><span style="color:#b4000f;font-weight:600;">11</span> educational institutions of I-II levels of accreditation</div>

<div>&nbsp;</div>

<div><span style="color:#b4000f;font-weight:600;">14</span> educational institutions of the highest accreditation level,</div>

<div><span style="color:#b4000f;font-weight:600;">4</span> of which have the status of a national university, and</div>

<div><span style="color:#b4000f;font-weight:600;">1</span> have the status of a state university.</div>

<div>&nbsp;</div>

<div><span style="color:#b4000f;font-weight:600;">9</span> vocational schools</div>',
                     alias: 'personnel_potential'
                   },
                   {
                     name: 'Розділ "Чому Вінниця" (3 блок "Надійний бізнес-партнер")',
                     title_uk: 'Надійний бізнес-партнер',
                     title_en: 'Reliable business partner',
                     information_uk: '<div style="text-align: center;"><span style="color:#b4000f;font-weight:600;">1 Місце</span></div>

<div style="text-align: center;">у рейтингу Regional Doing Business</div>

<div style="text-align: center;">&nbsp;</div>

<div style="text-align: center;"><span style="color:#b4000f;font-weight:600;">Firstreg Time Place</span></div>

<div style="text-align: center;">час реєстрації бізнесу фізичних осіб-підприємців</div>

<div style="text-align: center;">&nbsp;</div>

<div style="text-align: center;"><span style="color:#b4000f;font-weight:600;">1 Місце</span></div>

<div style="text-align: center;">у рейтингу прозорості інвестиційного сектору України</div>',
                     information_en: '<div style="text-align: center;"><span style="color:#b4000f;font-weight:600;">1 Place</span></div>

<div style="text-align: center;">in the rating Regional Doing Business</div>

<div style="text-align: center;">&nbsp;</div>

<div style="text-align: center;"><span style="color:#b4000f;font-weight:600;">Firstreg Time Place</span></div>

<div style="text-align: center;">time of registration of business of individual entrepreneurs</div>

<div style="text-align: center;">&nbsp;</div>

<div style="text-align: center;"><span style="color:#b4000f;font-weight:600;">1 Place</span></div>

<div style="text-align: center;">in the rating of transparency of the investment sector of Ukraine</div>',
                     description_uk: '<div>Вінницька область входить до ТОП-10 областей України з найкращим бізнес кліматом (за даними Київського міжнародного економічного форуму 2017р.)</div>',
                     description_en: '<div>Vinnytsia region is among the TOP-10 regions of Ukraine with the best business climate (according to the Kyiv International Economic Forum 2017)</div>',
                     alias: 'business_partner'
                   },
                   {
                     name: 'Розділ "Чому Вінниця" (блок "Сприятливий інвестиційний клімат")',
                     title_uk: 'Сприятливий інвестиційний клімат',
                     title_en: 'Favorable investment climate',
                     information_uk: '<div><span style="color:#b4000f;font-weight:600;">Оцінка &laquo;invА+&raquo;</span>&nbsp; &nbsp; &nbsp; &nbsp;Висока інвестиційна привабливість&raquo; в рейтингах IBI-Rating</div>

<div>&nbsp;</div>

<div><span style="color:#b4000f;font-weight:600;">Оцінка &laquo;uaА&raquo;</span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Висока кредитоспроможність&raquo; в рейтингах IBI-Rating</div>

<div>&nbsp;</div>

<div><span style="color:#b4000f;font-weight:600;">$115,9 млн</span>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;Обсяг прямих іноземних інвестицій на 2017 р. (80% з країн ЄС)</div>

<div>&nbsp;</div>

<div><span style="color:#b4000f;font-weight:600;">На 36% збільшився</span> Обсяг капітальних інвестицій за період з 2015 по 2017 рр.</div>',
                     information_en: '<div><span style="color:#b4000f;font-weight:600;">Rating &laquo;invА+&raquo;</span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&laquo;High investment attractiveness&raquo; in the ratings IBI-Rating</div>

<div>&nbsp;</div>

<div><span style="color:#b4000f;font-weight:600;">Rating &laquo;uaА&raquo;</span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&laquo;High creditworthiness&raquo; in the ratings IBI-Rating</div>

<div>&nbsp;</div>

<div><span style="color:#b4000f;font-weight:600;">$115,9 M</span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;The volume of foreign direct investment by 2017 (80% of EU countries)</div>

<div>&nbsp;</div>

<div><span style="color:#b4000f;font-weight:600;">Has increased by 36%</span> Volume of capital investments for the period from 2015 to 2017</div>',
                     description_uk: '<div style="text-align: justify;">У Вінниці створено два індустріальні парки: &laquo;Вінницький індустріальний парк&raquo; площею 60,7 га., та індустріальний парк &laquo;Вінницький кластер холодильного машинобудування&raquo; площею 19,3 га.</div>',
                     description_en: '<div style="text-align: justify;">Two industrial parks have been set up in Vinnytsia: Vinnytsia industrial park with an area of ​​60.7 hectares, and an industrial park &quot;Vinnytsia cluster of refrigeration engineering&quot; with an area of ​​19.3 hectares.</div>',
                     alias: 'investment_climate'
                   },
                   {
                     name: 'Розділ "Чому Вінниця" (блок "Міжнародний аеропорт «Вінниця»")',
                     title_uk: 'Міжнародний аеропорт «Вінниця»',
                     title_en: 'International airport "Vinnytsia"',
                     information_uk: '<div><span style="color:#b4000f;font-weight:600;">100 тис. пасажирів на рік</span> - пропускна спроможність</div>

<div>&nbsp;</div>

<div><span style="color:#b4000f;font-weight:600;">З&#39;єднує 3000</span> аеропортіву 80 містах, у 40 країнах по усьому світу</div>

<div>&nbsp;</div>

<div><span style="color:#b4000f;font-weight:600;">1 місце</span> по динаміці пасажиропотоку серед малих аеропортів в Україні станом на 2017 рік (до 100 тис. пасажирів на рік)</div>',
                     information_en: '<div><span style="color:#b4000f;font-weight:600;">100k passengers per year</span> - bandwidth</div>

<div>&nbsp;</div>

<div><span style="color:#b4000f;font-weight:600;">Connects 3000 airports</span> in 80 cities, in 40 countries around the world</div>

<div>&nbsp;</div>

<div><span style="color:#b4000f;font-weight:600;">1 place</span> on the dynamics of passenger traffic among small airports in Ukraine as of 2017 (up to 100 thousand passengers per year)</div>',
                     description_uk: '<div>Повністю муніципальний проект, весь цілісний майновий комплекс являється власністю територіальної громади міста</div>

<div>&nbsp;</div>',
                     description_en: '<div>Completely municipal project, the whole integral property complex is the property of the territorial community of the city</div>

<div>&nbsp;</div>',
                     alias: 'international_airport'
                   },
                   {
                     name: 'Розділ "Чому Вінниця" (блок "Залізничний вузол")',
                     title_uk: 'Залізничний вузол',
                     title_en: 'Railway junction',
                     information_uk: '',
                     information_en: '',
                     description_uk: '',
                     description_en: '',
                     alias: 'railway_junction'
                   },
                   {
                     name: 'Розділ "Чому Вінниця" (блок "Громадський транспорт")',
                     title_uk: 'Громадський транспорт',
                     title_en: 'Public transport',
                     information_uk: '<div><span style="color:#b4000f;font-weight:600;">502 одиниці</span> - загальна чисельність громадського транспорту міста</div>

<div>&nbsp;</div>

<div><span style="color:#b4000f;font-weight:600;">194 млн осіб в рік</span> - пасажиропотік</div>

<div>&nbsp;</div>

<div><span style="color:#b4000f;font-weight:600;">67</span> міських маршрути</div>',
                     information_en: '<div><span style="color:#b4000f;font-weight:600;">502 units</span> - the total number of public transport of the city</div>

<div>&nbsp;</div>

<div><span style="color:#b4000f;font-weight:600;">194M persons per year</span> - passenger traffic</div>

<div>&nbsp;</div>

<div><span style="color:#b4000f;font-weight:600;">67</span> city ​​routes</div>',
                     description_uk: '<div>Один з кращих зразків громадського транспорту - трамвай, тролейбус та автобус</div>',
                     description_en: '<div>One of the best examples of public transport is tram, trolley bus and bus</div>',
                     alias: 'public_transport'
                   },
                   {
                     name: 'Розділ "Чому Вінниця" (блок "Велосипедні доріжки")',
                     title_uk: 'Велосипедні доріжки',
                     title_en: 'Cycling tracks',
                     information_uk: '<div><span style="color:#b4000f;font-weight:600;">55 км</span> &ndash; загальна довжина велосипедних доріжок у місті</div>

<div>&nbsp;</div>

<div>Згідно Програми розвитку велосипедного руху у м. Вінниці на 2013-2020 роки заплановано розширити її довжину до <span style="color:#b4000f;font-weight:600;">85 км</span></div>',
                     information_en: '<div><span style="color:#b4000f;font-weight:600;">55 km</span> &ndash; total length of bicycle paths in the city</div>

<div>&nbsp;</div>

<div>According to the Cycling Development Program in Vinnytsia for 2013-2020, it is planned to extend its length to <span style="color:#b4000f;font-weight:600;">85 km</span></div>',
                     description_uk: '<div>Вінниця - це місто, яке намагається жити в гармонії з навколишнім середовищем</div>',
                     description_en: '<div>Vinnytsia - a city that tries to live in harmony with the environment</div>',
                     alias: 'cycling_tracks'
                   },
                   {
                     name: 'Розділ "Чому Вінниця" (блок "Бюджетні можливості")',
                     title_uk: 'Бюджетні можливості',
                     title_en: 'Budget opportunities',
                     information_uk: '',
                     information_en: '',
                     description_uk: '',
                     description_en: '',
                     alias: 'budget_opportunities'
                   },
                   {
                     name: 'Розділ "Чому Вінниця" (5 блок "Сергій Моргунов")',
                     title_uk: 'Сергій Моргунов',
                     title_en: 'Serhii Morhunov',
                     information_uk: '<div>Запрошуємо до співпраці у реалізації спільних інвестиційних ініціатив!</div>',
                     information_en: '<div>We invite you to cooperate in realization of joint investment initiatives!</div>',
                     description_uk: '<div>Вінниця &ndash; сучасне місто, економіка якого динамічно розвивається. Місто має тривалі промислові традиції, потужну освітню базу, наукові школи, які працюють у сфері інформаційних технологій, інженерії, медицини. Вінниця характеризується вигідним географічним розташуванням, що є його однією з ключових конкурентних переваг. За період незалежності економіка міста суттєво трансформувалась: відбувся структурний зсув від галузей машинобудування, електронної та хімічної промисловості в бік харчової промисловості, торгівлі та сфери послуг. Протягом останніх років міська влада активно працює над залученням інвестицій та розвитком промислового сектору. Інвестиційний паспорт буде цікавий та корисний приватним інвесторам, представникам іноземних компаній, громадянам міста і України.</div>',
                     description_en: '<div>Vinnytsia is a modern city, the economy of which is developing dynamically. The city has long industrial traditions, a powerful educational base, scientific schools that work in the field of information technology, engineering, medicine. Vinnytsia is characterized by an advantageous geographical location, which is one of its key competitive advantages. During the period of independence, the city&#39;s economy significantly transformed: there was a structural shift from the mechanical engineering, electronic and chemical industries to the food industry, trade and services. In recent years, the city authorities have been actively working on attracting investment and developing the industrial sector. The investment passport will be interesting and useful for private investors, representatives of foreign companies, citizens of the city and Ukraine.</div>',
                     alias: 'serhii_morhunov'
                   }
                 ])
  end
end
