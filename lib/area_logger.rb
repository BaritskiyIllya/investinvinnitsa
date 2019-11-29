class AreaLogger
  require 'current'
  def self.call(obj)
    if obj.was_deleted
      new_obj = AreaLog.new(user_id: Current.user.id,
                            description: "Видалено об'єкт #{obj.class.name}",
                            logable_type: obj.class.name,
                            logable_id: obj.id)
      new_obj.save(validate: false)
    elsif obj.was_changed && !obj.loggined && !obj.draft?
      obj.area_logs.create(user_id: Current.user.id, description: 'Оновлено')
      obj.loggined = true
    end
  end
end
