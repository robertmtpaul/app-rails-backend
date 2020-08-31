# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



print "Creating Users... "
User.destroy_all

u1 = User.create(name:"Nemo",email:"organixaustralia@live.com", password:"chicken",admin:false)
u2 = User.create(name:"Paul",email:"paul@ge.com.au", password:"chicken",admin:false)
u3 = User.create(name:"Karthik",email:"karthik@ge.com.au", password:"chicken",admin:false)
u4 = User.create(name:"Luke",email:"luke@ge.com.au", password:"chicken",admin:false)
u5 = User.create(name:"Zara",email:"zara@ge.com.au", password:"chicken",admin:false)


puts "created #{ User.count } Users."
