# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create Roles
Role.create!(name:"Admin")
Role.create!(name:"FarmAdmin")
Role.create!(name:"Employee")

# Create Farms
Farm.create!(name: "La valenciana", admin_id: 1)
Farm.create!(name: "El corazon",  admin_id: 1)

# Create users
User.create!(name: "Juan", email: "a@a.com", password: "foobar12", password_confirmation: "foobar12", role_id: 1)

User.create!(name: "Arley", email: "b@b.com", password: "foobar12", password_confirmation: "foobar12", farm_id: 1, role_id: 2)

User.create!(name: "Dorita", email: "c@c.com", password: "foobar12", password_confirmation: "foobar12", farm_id: 1, role_id: 3)

# Crate Tasks
Task.create!(title: "Sin empezar",  user_id: 2,priority: 1)
Task.create!(title: "En proceso", user_id: 2, status: 50, priority: 1)
Task.create!(title: "Terminada", user_id: 2, status: 100, priority: 1)

# Create Lotes
Lote.create!(name: "Cañaveral", size: 20.2, farm_id: 1, fruit_type: "Naranja" )
Lote.create!(name: "Lote1", size: 25, farm_id: 1, fruit_type: "Limon" )
Lote.create!(name: "Pirineos", size: 10.2, farm_id: 1, fruit_type: "Papaya" )
Lote.create!(name: "Theran", size: 5.2, farm_id: 1, fruit_type: "Naranja" )

# Create Sub Lotes
SubLote.create!(name: "lote1a", code: "1asub1", plantation_date: Date.yesterday, tree_count: 340, lote_id: 1, fruit_variety: "Sweety")
SubLote.create!(name: "lote1b", code: "1asub2", plantation_date: Date.yesterday, tree_count: 200, lote_id: 1, fruit_variety: "Valencia")
SubLote.create!(name: "lote1c", code: "1asub2", plantation_date: Date.yesterday, tree_count: 100, lote_id: 1, fruit_variety: "Salustiana")

#Create Production Reports
ProductionReport.create!(amount: 2, sub_lote_id: 1, created_at: Date.today.weeks_ago(4))
ProductionReport.create!(amount: 4, sub_lote_id: 1, created_at: Date.today.weeks_ago(4))
ProductionReport.create!(amount: 2, sub_lote_id: 1, created_at: Date.today.weeks_ago(3))
ProductionReport.create!(amount: 5, sub_lote_id: 1, created_at: Date.today.weeks_ago(3))
ProductionReport.create!(amount: 6, sub_lote_id: 1, created_at: Date.today.weeks_ago(3))
ProductionReport.create!(amount: 2, sub_lote_id: 1, created_at: Date.today.weeks_ago(2))
ProductionReport.create!(amount: 7, sub_lote_id: 1, created_at: Date.today.weeks_ago(1))
ProductionReport.create!(amount: 7, sub_lote_id: 1, created_at: Date.today)
