Faker::Config.locale = :ja

FactoryBot.define do
  factory :user do
    

    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {'abc123'}
    password_confirmation {password}
    family_name           {Faker::Name.last_name}
    first_name            {Faker::Name.first_name}
    family_name_kana      {Faker::Name.last_name.tr('ぁ-ん', 'ァ-ン')}
    first_name_kana       {Faker::Name.first_name.tr('ぁ-ん', 'ァ-ン')}
    birthday              {Faker::Date.birthday(min_age: 0, max_age: 130)}
  end
end