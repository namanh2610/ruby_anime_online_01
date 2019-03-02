# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(first_name: "aaaaaa",
             last_name: "aaaaaa",
             email: "abc@gmail.com",
             account: "aaaaaa",
             password: "123456",
             password_confirmation: "123456",
             user_role_id: 1,
             created_at: "2019-02-21 02:32:21")
User.create!(first_name: "bbbbbb",
             last_name: "bbbbbb",
             email: "abc1@gmail.com",
             account: "bbbbbb",
             password: "123456",
             password_confirmation: "123456",
             user_role_id: 3,
             created_at: "2019-02-21 02:32:21")
