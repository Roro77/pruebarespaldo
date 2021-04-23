# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


100.times do 
    Tweet.create(
        content: Faker::Lorem.sentence, 
        user_id: [1,2,3,4,5,6].sample)
end

100.times do 
    User.create(
        { 
        name:Faker::Sports::Basketball.player,
        photo_avatar:Faker::Avatar.image,
        email:Faker::Internet.email,
        password: '123456'
        }
    )
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?