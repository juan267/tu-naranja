# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create Roles
admin = Role.create!(name:"Admin")
farm_admin = Role.create!(name:"FarmAdmin")
employee = Role.create!(name:"Employee")

# Create Farms
Farm.create!(name: "La valenciana", admin_id: 1)
Farm.create!(name: "El corazon",  admin_id: 1)

# Create users
User.create!(name: "Juan", email: "a@a.com", password: "foobar12", password_confirmation: "foobar12", role_id: 1)

User.create!(name: "Arley", email: "b@b.com", password: "foobar12", password_confirmation: "foobar12", farm_id: 1, role_id: 2)

User.create!(name: "Dorita", email: "c@c.com", password: "foobar12", password_confirmation: "foobar12", farm_id: 1, role_id: 3)

# Crate Tasks

#Create Activities
Task.create!(title: "Sin empezar",  user_id: 2,priority: 1)
Task.create!(title: "En proceso", user_id: 2, status: 50, priority: 1)
Task.create!(title: "Terminada", user_id: 2, status: 100, priority: 1)
