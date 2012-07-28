namespace :db do
  desc "Fill database with sample data"
  task :populate_users => :environment do
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

namespace :db do
  desc "Fill database with sample data"
  task :populate_articles => :environment do
    50.times do |n|
      User.first.articles.create!(:name =>Faker::Lorem.sentence(2), :description => Faker::Lorem.sentence(5), :price => n)
    end
  end
end