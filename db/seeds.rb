# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

print "Creating Users... "
User.destroy_all

u1 = User.create(name:"Nemo",email:"organixaustralia@live.com", password:"chicken",admin:true)
u2 = User.create(name:"Paul",email:"paul@ge.com.au", password:"chicken",admin:true)
u3 = User.create(name:"Karthik",email:"karthik@ge.com.au", password:"chicken",admin:true)
u4 = User.create(name:"Luke",email:"luke@ge.com.au", password:"chicken",admin:false)
u5 = User.create(name:"Zara",email:"zara@ge.com.au", password:"chicken",admin:false)


puts "created #{ User.count } Users."

print "Creating Follows... "
Follow.destroy_all

# f1 = Follow.create(follower_id:u1.id,followed_id:u1.id)
# f2 = Follow.create(follower_id:u2.id,followed_id:u2.id)
# f3 = Follow.create(follower_id:u3.id,followed_id:u3.id)
# f4 = Follow.create(follower_id:u4.id,followed_id:u4.id)
# f5 = Follow.create(follower_id:u5.id,followed_id:u5.id)

u1.following << u2 << u3 << u4 << u5
u2.following << u3 << u1 << u4 << u5
u3.following << u2 << u1 << u4 << u5
u4.following << u2 << u3 << u1 << u5
u5.following << u2 << u3 << u1 << u4
#u2.followers

puts "created #{ Follow.count } Follows."


print "Creating Posts... "
Post.destroy_all

p1 = Post.create(user_post:"hello world 1",user_photo:"https://www.fillmurray.com/200/300")
p2 = Post.create(user_post:"hello world 2",user_photo:"https://www.fillmurray.com/201/300")
p3 = Post.create(user_post:"hello world 3",user_photo:"https://www.fillmurray.com/202/300")
p4 = Post.create(user_post:"hello world 4",user_photo:"https://www.fillmurray.com/205/300")
p5 = Post.create(user_post:"hello world 5",user_photo:"https://www.fillmurray.com/204/300")

u1.posts << p1
u2.posts << p2
u3.posts << p3
u4.posts << p4
u5.posts << p5

puts "created #{ Post.count } Posts."

print "Creating Comments..."
Comment.destroy_all

c1 = Comment.create(name: "Random comment", comment: "Blah blah")

puts "Created #{ Comment.count } comments."

print "Creating PostPhotos... "
PostPhoto.destroy_all

ph1 = PostPhoto.create(photo:"https://www.fillmurray.com/200/300")
ph2 = PostPhoto.create(photo:"https://www.fillmurray.com/201/300")
ph3 = PostPhoto.create(photo:"https://www.fillmurray.com/202/300")
ph4 = PostPhoto.create(photo:"https://www.fillmurray.com/205/300")
ph5 = PostPhoto.create(photo:"https://www.fillmurray.com/204/300")


puts "created #{ PostPhoto.count } PostPhotos."

u1.post_photos << ph1
u2.post_photos << ph2
u3.post_photos << ph3
u4.post_photos << ph4
u5.post_photos << ph5

puts "Testing associations:"
print "Follows by #{ User.first.name }, By: "
puts User.first.followers

puts "Testing associations:"
print "Follows by #{ User.last.name }, By: "
puts User.last.followers

puts "Testing associations:"
print "Posts by #{ User.first.name }, By: "
puts User.first.posts

puts "Testing associations:"
print "Posts by #{ User.last.name }, By: "
puts User.last.posts

puts "Testing associations:"
print "Photos by #{ User.first.name }, By: "
puts User.first.post_photos

puts "Testing associations:"
print "Photos by #{ User.last.name }, By: "
puts User.last.post_photos
