require 'factory_bot'
FactoryBot.define do
    score = [0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0]

    factory :random_unit, class: Unit do 
        image {Faker::File.file_name(dir: 'assets/images/', ext: 'jpg')}
        title { Faker::Lorem.sentence }
        region { Faker::Address.state }
        cp { Faker::Lorem.sentence }
        description { Faker::Lorem.paragraph }
        price { Faker::Number.decimal(l_digits: 3, r_digits: 2)}
        score { score.sample }
    end

    factory :random_user, class: User do
        email { Faker::Internet.unique.email }
        username { Faker::Internet.unique.username }
        password { Faker::Internet.password }
        name { Faker::Name.name }
    end
end