100.times do |n|
  email = Faker::Internet.email
  password = "password"
  User.create!(name: "hhhhhhhhhhhhhhhhhhhhhhhhh",
               email: email,
               password: password,
               password_confirmation: password,
               )
end
