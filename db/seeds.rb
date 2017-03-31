User.create!(name:  "Hoai",
             email: "khanhhoai95@gmail.com",
             gender: "Male",
             password:              "password",
             password_confirmation: "password",
             role: "teacher")

User.create!(name:  "Duy",
             email: "duyle.bks2014@gmail.com",
             gender: "Gay Male",
             password:              "password",
             password_confirmation: "password",
             role: "student")

29.times do |n|
  name  = Faker::Name.name
  email = Faker::Internet.free_email
  password = "password"
  User.create!(name:  name,
               email: email,
               gender: "Female",
               password:              password,
               password_confirmation: password,
               role: "student")
end

Group.create!(group_name: "Thematic")

31.times do |n|
	users = User.all
	Belonging.create!(user_id: users[n].id, group_id: Group.first.id)
end