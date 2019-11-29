class UserRoles
  def self.roles_array
    user_roles = []
    User.valid_roles.each do |role|
      user_roles.push(key: User.mask_for(role), value: I18n.t(role))
    end
    user_roles
  end

  def self.roles_array_for_moder
    %i[questionnaire user].map { |role| { key: User.mask_for(role), value: I18n.t(role) } }
  end
end
