User.create!(name:  "Admin",
             email: "admin@gmail.com",
             gender: "Male",
             password:              "password",
             password_confirmation: "password",
             role: "admin")

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

User.create!(name:  "Trung",
             email: "trungnguyen.bks2014@gmail.com",
             gender: "Gay Male",
             password:              "password",
             password_confirmation: "password",
             role: "teacher")

User.create!(name:  "Tan",
             email: "tanvo.bks2014@gmail.com",
             gender: "Gay Male",
             password:              "password",
             password_confirmation: "password",
             role: "student")

3.times do |n|
  name  = Faker::Name.name
  email = Faker::Internet.unique.free_email
  password = "password"
  User.create!(name:  name,
               email: email,
               gender: "Female",
               password:              password,
               password_confirmation: password,
               role: "teacher")
end

88.times do |n|
  name  = Faker::Name.name
  email = Faker::Internet.unique.free_email
  password = "password"
  User.create!(name:  name,
               email: email,
               gender: "Female",
               password:              password,
               password_confirmation: password,
               role: "student")
end

teachers = User.all.map { |u| u if u.role == "teacher" }.compact
students = User.all.map { |u| u if u.role == "student" }.compact

Group.create!(group_name: "Thematic")
9.times do |n|
  Group.create!(group_name:  Faker::Educator.course)
end

groups = Group.all
10.times do |n|
  Belonging.create!(user_id: teachers[n/2].id, group_id: groups[n].id)
end

30.times do |n|
  Belonging.create!(user_id: students[n].id, group_id: groups[0].id)
  Belonging.create!(user_id: students[n].id, group_id: groups[1].id)
  Belonging.create!(user_id: students[n].id, group_id: groups[2].id)
end

30.times do |n|
  Belonging.create!(user_id: students[30+n].id, group_id: groups[3].id)
  Belonging.create!(user_id: students[30+n].id, group_id: groups[4].id)
  Belonging.create!(user_id: students[30+n].id, group_id: groups[5].id)
end

30.times do |n|
  Belonging.create!(user_id: students[60+n].id, group_id: groups[6].id)
  Belonging.create!(user_id: students[60+n].id, group_id: groups[7].id)
  Belonging.create!(user_id: students[60+n].id, group_id: groups[8].id)
end