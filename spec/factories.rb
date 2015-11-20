FactoryGirl.define do
  factory :user do
    id {Faker::Number.number(3)}
    email {Faker::Internet.email}
    username {Faker::Name.name[4..20]}
    password "password"
    password_confirmation "password"
    confirmed_at Date.today
  end

  factory :admin, class: User do
    id {Faker::Number.number(3)}
    email {Faker::Internet.email}
    username {Faker::Name.name[4..20]}
    password "password"
    password_confirmation "password"
    confirmed_at Date.today
    admin true
  end

  factory :locked, class: User do
    id {Faker::Number.number(3)}
    email {Faker::Internet.email}
    username {Faker::Name.name[4..20]}
    password "password"
    password_confirmation "password"
    confirmed_at Date.today
    locked_at Date.today
  end
end
