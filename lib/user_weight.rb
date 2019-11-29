class UserWeight
  def self.check(user, current_user)
    weight = { user: 0, questionnaire: 1, moderator: 2, admin: 3 }
    weight[user.roles.first] < weight[current_user.roles.first]
  end
end
