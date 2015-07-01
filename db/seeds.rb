# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

2.times do
  User.create!(
     username: Faker::Internet.user_name,
     password: Faker::Internet.password
  )
end

users = User.all
User.create!(username: "alger", password: "hello")

10.times do
  List.create!(
     name: Faker::Lorem.sentence,
     permissions: "open",
     user: users.sample
  )
end

lists = List.all

20.times do
  Item.create!(
     description: Faker::Lorem.sentence,
     complete: false,
     list: lists.sample
  )
end


puts "#{User.count} users have been created!"
puts "#{List.count} lists have been created!"
puts "#{Item.count} items have been created!"