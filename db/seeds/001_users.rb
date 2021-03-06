# frozen_string_literal: true

PASSWORD = ENV.fetch('INITIAL_PASSWORD')

5.times do
  User.create(email: Faker::Internet.email,
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              password: PASSWORD,
              password_confirmation: PASSWORD,
              confirmed_at: Time.now)
end

Admin.create(email: Faker::Internet.email,
             first_name: Faker::Name.first_name,
             last_name: Faker::Name.last_name,
             password: PASSWORD,
             password_confirmation: PASSWORD,
             confirmed_at: Time.now)
