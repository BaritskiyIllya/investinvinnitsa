module UsersHelper
  def photo(user)
    user.image.url || 'person.png'
  end

  def full_name(user)
    "#{user.last_name} #{user.first_name}"
  end
end
