# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


50.times  do |i|  
    Unit.create(
        image: "img#{i}.jpg", 
        title: "unit#{i}", 
        region: Faker::Address.community, 
        description: Faker::Lorem.paragraph_by_chars(number: 400), 
        cp: Faker::Lorem.sentence, 
        price: Faker::Number.decimal(l_digits: 3, r_digits: 2),
        score: [0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0].sample
    )
end

20.times do |i|
    User.create(
        name: Faker::Name.name,
        username: "user#{i}",
        email: "user#{i}@example.com",
        password: "123456"
    )
end

50.times do |i|
    Review.create(
        body: Faker::Lorem.paragraph,
        score: [0,1,2,3,4,5].sample,
        user_id: User.all.ids.sample,
        unit_id: Unit.all.ids.sample
    )
end