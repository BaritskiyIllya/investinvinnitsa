namespace :main_menu do
  task fill: :environment do
    Menu.destroy_all
    Menu.create(
      [{ id: 1, title_uk: 'Про місто', title_en: 'About city', tag_alt_uk: 'Про місто', tag_alt_en: 'About city', position: 1, menu_group_id: 1, parent_id: 0, active: true, menu_type: 'menu', link: '' },
       { id: 2, title_uk: 'Переваги', title_en: 'Advantages', tag_alt_uk: 'Переваги', tag_alt_en: 'Advantages', position: 2, menu_group_id: 1, parent_id: 0, active: true, menu_type: 'menu', link: '#advantages' },
       { id: 3, title_uk: 'Проекти', title_en: 'Projects', tag_alt_uk: 'Проекти', tag_alt_en: 'Projects', position: 3, menu_group_id: 1, parent_id: 0, active: true, menu_type: 'menu', link: '/projects' },
       { id: 4, title_uk: 'Мапа', title_en: 'Map', tag_alt_uk: 'Мапа', tag_alt_en: 'Map', position: 4, menu_group_id: 1, parent_id: 0, active: true, menu_type: 'menu', link: '#invest_map_preview' },
       { id: 5, title_uk: 'Гід інвестора', title_en: 'Investors Guide', tag_alt_uk: 'Гід інвестора', tag_alt_en: 'Investors Guide', position: 5, menu_group_id: 1, parent_id: 0, active: true, menu_type: 'menu', link: '' },
       { id: 6, title_uk: 'Контакти', title_en: 'Contacts', tag_alt_uk: 'Контакти', tag_alt_en: 'Contacts', position: 6, menu_group_id: 1, parent_id: 0, active: true, menu_type: 'menu', link: '#feedback' },
       { id: 7, title_uk: 'Матеріали', title_en: 'Materials', tag_alt_uk: 'Матеріали', tag_alt_en: 'Materials', position: 7, menu_group_id: 1, parent_id: 0, active: true, menu_type: 'menu', link: '/materials' }])
    puts 'Upload finished successfully'
  end
end
