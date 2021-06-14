# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Charge.destroy_all
HouseCoin.destroy_all
Order.destroy_all
RealEstate.destroy_all
User.destroy_all

# Faker::Config.locale = "fr"

10.times do
    User.create(
        email: Faker::Internet.email,
        encrypted_password: Faker::Internet.password(min_length: 8)
    )
end

30.times do
    # Geocode not added for now, maybe possible to replace by latitude/longitude
    RealEstate.create(
        name: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4),
        description: Faker::Lorem.paragraph_by_chars(number: 300, supplemental: true),
        user: User.all.sample,
        adress: Faker::Address.street_address,
        zipcode: Faker::Address.zip_code,
        city: Faker::Address.city
    )
end

30.times do
    Order.create()
end

30.times do
    HouseCoin.create(
        order: Order.all.sample,
        real_estate_id: RealEstate.all.sample,
        token_price: Faker::Number.number(digits: 12),
        user_id: User.all.sample
    )
end

30.times do
    Charge.create(
        stripe_id: Faker::Stripe.valid_token,
        user_id: User.all.sample,
        order_id: Order.all.sample
    )
end

puts "*"*30
puts 'Base de données remplie !'
puts "*"*30