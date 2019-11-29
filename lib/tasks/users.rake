namespace :users do
  task :set_admin, %i[user_email] => :environment do |task, args|
    email = args.user_email
    # pass = args.user_pass
    puts "Loading user with email = #{email}"
    user = User.find_by(email: email)
    # if user && user.valid_password?(pass)
    if user
      user.roles = :admin
      user.save
      puts "User with email: #{email} is admin!"
    end
  end
end
