namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(:name => "Ruslan",
                 :email => "exruslankuzma@gmail.com",
                 :password => "111111",
                 :password_confirmation => "111111")
    99.times do |n|
      name  = Faker::Name.name
      email = "user-#{n+1}@gmail.com"
      password  = "111111"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
  end
end