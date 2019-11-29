json.events @admin_period_event.events do |event|
  json.id event.id
  I18n.locale = :uk
  json.title_uk event.title
  I18n.locale = :en
  json.title_en event.title
end
