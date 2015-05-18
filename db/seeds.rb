require 'faker'

member = User.create!(name: "Member User", email: "member@example.com", password: "helloworld")
member.skip_confirmation!
member.save!   
    
10.times do
Item.create!(name: Faker::Lorem.sentence, user_id: member.id)
end

puts "Seed Finished"
puts "#{Item.count} items created"


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
