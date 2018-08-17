# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# Create Users
 1.times do
   user = User.create!(
      email:  Faker::Internet.safe_email,
      password: Faker::Internet.password(8),
      role: "member"
   )
 end

 users = User.all


 # Create Wikis
 1.times do
   wiki = Wiki.create!(
     title:  Faker::String.random,
     body:   Faker::Hipster.paragraphs,
     private: Faker::Boolean.boolean,
     user: users.sample
   )

 end


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
