# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

adress = ["115 Rue Samuel Champlain","17 rue du rivayral","1900 route de lodève","29 rue des aqueducs","9 rue Neuve","6 allée roch braz","75 Rue Nicolas Chorier","18 rue de Flacé","20 route de Brinon","70 Bis Boulevard de Stalingrad"]
zipcode = ["17600","34725","34700","69005","19200","44510","38000","71000","58500","24000"]
city = ["Le Gua","Saint André de sangonis","fozieres","lyon","Saint Angel","le pouliguen","Grenoble","Mâcon","Rix","Périgueux"]  

require 'faker'
Message.destroy_all
Charge.destroy_all
HouseCoin.destroy_all
Order.destroy_all
RealEstate.destroy_all
User.destroy_all

# Faker::Config.locale = "fr"

(1..10).each do |i|
    user = User.new(
        email: "user#{i}@example.com",
        password: 'password',
        username: Faker::FunnyName.name,
        is_admin?: Faker::Boolean.boolean
    )

    if user.save
        puts "user OK"
    else
        puts user.errors.messages
    end
end

images = [
    "https://images.unsplash.com/photo-1593696140826-c58b021acf8b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
    "https://images.unsplash.com/photo-1560184897-ae75f418493e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
    "https://images.unsplash.com/photo-1558036117-15d82a90b9b1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
    "https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
    "https://images.unsplash.com/photo-1502005229762-cf1b2da7c5d6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80"
]

(0..1).each do |i|
    real = RealEstate.new(
        name: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4),
        description: Faker::Lorem.paragraph_by_chars(number: 300, supplemental: true),
        user: User.all.sample,
        adress: adress[i],
        zipcode: zipcode[i],
        city: city[i],
        image_urls: images.sample,
        price: Faker::Number.between(from: 50000, to: 150000),
        validated?: true
    )

    if real.save
        puts "real OK"
    else
        puts real.errors.messages
    end
end
(2..6).each do |i|
    real = RealEstate.new(
        name: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4),
        description: Faker::Lorem.paragraph_by_chars(number: 300, supplemental: true),
        user: User.all.sample,
        adress: adress[i],
        zipcode: zipcode[i],
        city: city[i],
        image_urls: images.sample,
        price: Faker::Number.between(from: 100000, to: 500000),
        validated?: true
    )

    if real.save
        puts "real OK"
    else
        puts real.errors.messages
    end
end

(7..8).each do |i|
    real = RealEstate.new(
        name: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4),
        description: Faker::Lorem.paragraph_by_chars(number: 300, supplemental: true),
        user: User.all.sample,
        adress: adress[i],
        zipcode: zipcode[i],
        city: city[i],
        image_urls: images.sample,
        price: Faker::Number.between(from: 500000, to: 1500000),
        validated?: true
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
