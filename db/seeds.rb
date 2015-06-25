# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

3.times do
  User.create!(
     username: Faker::Internet.user_name,
     password: Faker::Internet.password
  )
end

users = User.all

4.times do
  List.create!(
     name: Faker::Lorem.sentence,
     permissions: "public",
     user: users.sample
  )
end

lists = List.all

10.times do
  Item.create!(
     description: Faker::Lorem.sentence,
     list: lists.sample
  )
end

User.create!(username: "alger", password: "hello")

puts "#{User.count} users have been created!"
puts "#{List.count} lists have been created!"
puts "#{Item.count} items have been created!"