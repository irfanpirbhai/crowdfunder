# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Project.destroy_all
Pledge.destroy_all

user = User.create!(first_name: "Irfan", 
                    last_name: "Pirbhai", 
                    email: "fanjaan@gmail.com", 
                    password: "1234")

user2 = User.create!(first_name: "Kiran", 
                    last_name: "Shahbaz", 
                    email: "kshahbaz84@gmail.com", 
                    password: "1234")

(1..50).each do |n|
  user.projects.create!(title: "Project #{n}", 
                        teaser: "Teaser text #{n}", 
                        description: "description #{n}", 
                        goal: 13000)
end

(1..5).each do |n|
  user2.projects.create!(title: "#{user2.first_name}'s project #{n}", 
                        teaser: "Teaser text #{n}", 
                        description: "description #{n}", 
                        goal: 6000)
end