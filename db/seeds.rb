10.times do
  Movie.create(title: Faker::Movie.title)
end
User.create!(email: Faker::Internet.email, password: 'aassdd123', password_confirmation: 'aassdd123')
User.create!(email: 'pilot@test', password: '123123', password_confirmation: '123123')
User.create!(email: 'admin@test.com', password: 'aassdd123', password_confirmation: 'aassdd123')
