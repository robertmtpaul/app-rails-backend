# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

print "Creating Users... "
User.destroy_all

u1 = User.create(name:"Nemo", email:"organixaustralia@live.com", password:"chicken", admin:true, profile_pic: "http://place-puppy.com/200x204")
u2 = User.create(name:"Paul",email:"paul@ge.com.au", password:"chicken",admin:true, profile_pic: "http://place-puppy.com/200x205")
u3 = User.create(name:"Karthik",email:"karthik@ge.com.au", password:"chicken",admin:true, profile_pic: "http://place-puppy.com/200x206")
u4 = User.create(name:"Luke",email:"luke@ge.com.au", password:"chicken",admin:false, profile_pic: "http://place-puppy.com/200x207")
u5 = User.create(name:"Zara",email:"zara@ge.com.au", password:"chicken",admin:false, profile_pic: "http://place-puppy.com/200x208")


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

p1 = Post.create(user_post:"I'm baby dIY hella banh mi prism next level crucifix woke tbh. Vegan tousled fixie drinking vinegar gluten-free. Flannel listicle plaid health goth cliche. Knausgaard adaptogen bespoke sustainable blue bottle twee slow-carb organic tumeric helvetica. Cardigan polaroid vape kogi meh aesthetic edison bulb taxidermy. Kombucha wayfarers keytar sartorial YOLO.", user_photo:"https://res.cloudinary.com/dgqqw6hwo/image/upload/v1597237725/bzfjazboqhfn8hvwdbma.jpg")
p2 = Post.create(user_post:"Tilde blog adaptogen thundercats. Hammock small batch adaptogen godard raw denim cardigan actually. Fashion axe mlkshk man bun occupy brunch. Prism cray butcher twee, pork belly etsy lo-fi single-origin coffee. Hot chicken whatever retro occupy pabst gastropub health goth lumbersexual. Disrupt craft beer shabby chic intelligentsia roof party mlkshk tofu distillery viral kitsch leggings cred four loko humblebrag.",user_photo:"https://res.cloudinary.com/dgqqw6hwo/image/upload/v1599184865/skateboard_ji4k2r.jpg")
p3 = Post.create(user_post:"Vexillologist copper mug sustainable yuccie plaid, synth unicorn prism keffiyeh everyday carry you probably haven't heard of them. Neutra PBR&B XOXO fixie intelligentsia. Brooklyn subway tile snackwave af. Prism cred neutra migas tacos. YOLO tattooed wayfarers af, kogi mixtape four dollar toast tofu narwhal. Biodiesel selvage seitan kogi. Schlitz fashion axe marfa bushwick ugh pork belly kickstarter gentrify edison bulb dreamcatcher kale chips knausgaard.",user_photo:"https://res.cloudinary.com/dgqqw6hwo/image/upload/v1599986963/IMG_8525_jqbynr.jpg")
p4 = Post.create(user_post:"Banjo cronut single-origin coffee, drinking vinegar kogi semiotics slow-carb vexillologist farm-to-table venmo shabby chic. Adaptogen squid kitsch twee, street art live-edge la croix food truck coloring book cloud bread photo booth humblebrag selvage. Copper mug umami unicorn echo park, normcore twee knausgaard fam blue bottle pok pok whatever trust fund. Semiotics bicycle rights occupy cray, normcore everyday carry fixie. DIY celiac tumeric chia vaporware blue bottle bespoke fingerstache umami glossier chambray coloring book small batch.",user_photo:"https://res.cloudinary.com/dgqqw6hwo/image/upload/v1599986947/daniel-korpai-HyTwtsk8XqA-unsplash_ownhom.jpg")
p5 = Post.create(user_post:"Chartreuse roof party master cleanse enamel pin aesthetic offal quinoa iPhone edison bulb palo santo snackwave hell of. Edison bulb air plant plaid cliche retro vaporware vegan, subway tile shoreditch. Typewriter pour-over portland, cronut skateboard leggings neutra next level actually you probably haven't heard of them organic direct trade palo santo. Chillwave shabby chic williamsburg thundercats literally pour-over. Selvage slow-carb shaman paleo cornhole farm-to-table. Yuccie pork belly humblebrag polaroid pabst selvage pickled everyday carry retro kitsch waistcoat.",user_photo:"https://res.cloudinary.com/dgqqw6hwo/image/upload/v1599986928/ramon-salinero-vEE00Hx5d0Q-unsplash_lfjdqr.jpg")

u1.posts << p1
u2.posts << p2
u3.posts << p3
u4.posts << p4
u5.posts << p5

puts "created #{ Post.count } Posts."

print "Creating Comments..."
Comment.destroy_all

c1 = Comment.create(name: "Random comment", content: "Blah blah")
c2 = Comment.create(name: "Another comment", content: "Gesellschaftswissenschaftliche Schwerpunkt")
c3 = Comment.create(name: "Ungefaelliges Kommentar", content: "Ganz furchtbar")

p1.comments << c1
p2.comments << c2
p3.comments << c3
puts "Created #{ Comment.count } comments."

print "Creating PostPhotos... "
PostPhoto.destroy_all

ph1 = PostPhoto.create(photo:"https://res.cloudinary.com/dgqqw6hwo/image/upload/v1599986936/massimo-virgilio-XxBez52FEks-unsplash_xvdtze.jpg")
ph2 = PostPhoto.create(photo:"https://res.cloudinary.com/dgqqw6hwo/image/upload/v1599806825/z1vjnfqlxgistkcsr5pr.jpg")
ph3 = PostPhoto.create(photo:"https://res.cloudinary.com/dgqqw6hwo/image/upload/v1599986928/ramon-salinero-vEE00Hx5d0Q-unsplash_lfjdqr.jpg")
ph4 = PostPhoto.create(photo:"https://res.cloudinary.com/dgqqw6hwo/image/upload/v1599987124/francisco-ghisletti-CfMEecyNtHc-unsplash_xg8tui.jpg")
ph5 = PostPhoto.create(photo:"https://res.cloudinary.com/dgqqw6hwo/image/upload/v1599987181/simon-rae-CNqxMrOGV4w-unsplash_n1fjkw.jpg")


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
