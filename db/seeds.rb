# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create!(name: 'Admin Adminson', bio: 'Just an admin', profile_type: :admin, email_address: 'admin@mail.com', password: '123456')

30.times do
  User.create!(
    name: Faker::Name.name,
    bio: Faker::ChuckNorris.fact,
    profile_type: :user,
    email_address: Faker::Internet.email,
    password: '123456'
  )
end

30.times do
  users_count = rand(2..15)
  Chat.create!(
    name: Faker::Books::CultureSeries.book,
    users: User.all.sample(users_count)
  )
end
