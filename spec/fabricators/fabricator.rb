Fabricator(:category) do
  title { Faker::Lorem.words.collect {|w| w.titlecase}.join(' ') }
end

Fabricator(:user) do
  email { Faker::Internet.email }
  password 'password'
  password_confirmation { |user| user.password }
end

Fabricator(:confirmed_user, from: :user) do
  confirmed_user true
  confirmed_at { Time.now }
  confirmation_token nil
end