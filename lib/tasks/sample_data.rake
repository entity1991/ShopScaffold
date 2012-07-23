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

#namespace :db do
#  desc "Fill database with sample data"
#  task :populate_articles => :environment do
#    70.times do |n|
#      name  = Faker::Name.name
#      desc = Faker::Name.name + n.to_s
#      filler_id = n + 10
#      price = n*10
#      User.create!(:name => name,
#                   :description => desc,
#                   :filler_id => filler_id,
#                   :price => price)
#    end
#  end
#end