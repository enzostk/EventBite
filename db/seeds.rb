# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
Event.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('events')
Attendance.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('attendances')

5.times do |i|
User.create!(
  email: "testuser#{i}@yopmail.com",
  password: "password",
  description: Faker::Lorem.paragraph(sentence_count: 6),
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name
)
end

5.times do |i|
Event.create!(
  start_date: "2023-06-03",
  duration: 50,
  title: Faker::Lorem.sentence(word_count: 2),
  description: Faker::Lorem.sentence(word_count: 20),
  price: rand(3..90) * 10,
  location: Faker::Address.city,
  admin_id: User.first.id
)
end

Attendance.create(
  stripe_customer_id: "123456",
  user_id: User.first.id,
  event_id: Event.first.id
)