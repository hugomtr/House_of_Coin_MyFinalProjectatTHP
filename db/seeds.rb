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
    user = User.new(
        email: Faker::Internet.email,
        password: Faker::Internet.password(min_length: 8)
    )

    if user.save
        puts "user OK"
    else
        puts user.errors.messages
    end
end

30.times do
    # Geocode not added for now, maybe possible to replace by latitude/longitude
    real = RealEstate.new(
        name: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4),
        description: Faker::Lorem.paragraph_by_chars(number: 300, supplemental: true),
        user: User.all.sample,
        adress: Faker::Address.street_address,
        zipcode: Faker::Address.zip_code,
        city: Faker::Address.city
    )

    if real.save
        puts "real OK"
    else
        puts real.errors.messages
    end
end

30.times do
    order = Order.new()
    if order.save
        puts "order OK"
    else
        puts order.errors.messages
    end
end

30.times do
    coin = HouseCoin.new(
        order: Order.all.sample,
        real_estate_id: RealEstate.all.sample.id,
        token_price: Faker::Number.number(digits: 9),
        user_id: User.all.sample.id
    )
    if coin.save
        puts "coin OK"
    else
        puts "coin"
        puts coin.errors.messages
    end
end

30.times do
    charge = Charge.new(
        stripe_id: Faker::Stripe.valid_token,
        user_id: User.all.sample.id,
        order_id: Order.all.sample.id
    )
    if charge.save
        puts "charge OK"
    else
        puts charge.errors.messages
    end
end

puts "*"*30
puts 'Base de données remplie !'
puts "*"*30
