# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#----------- Users------------------

user_1 = User.create do |a|
a.fname = "Benjamin"
a.lname = "Loustau"
a.email = "benloustau@gmail.com"
a.password = "Lossia12"
a.bio = "I am Ben, an Chef by trade and WEB developer by choice."
a.location = "NYC"
end

user_2 = User.create do |a|
a.fname = "Anh"
a.lname = "Phuong"
a.email = "aphuong85@gmail.com"
a.password = "aphuong"
a.bio = "I am Anh.I have been a teacher and now code professionally."
a.location = "NYC"
end

user_3 = User.create do |a|
a.fname = "Keika"
a.lname = "Jones"
a.email = "kjones@gmail.com"
a.password = "kjones543"
a.bio = "I am keika.I used to word for a smal advertisement firm and I am now a student of NYCDA."
a.location = "NYC"
end

user_4 = User.create do |a|
a.fname = "Anne_Camille"
a.lname = "Charpie"
a.email = "accharpie@gmail.com"
a.password = "accharpie123"
a.bio = "I am Anne, I am an assistant business manager."
a.location = "NYC"
end

user_5 = User.create do |a|
a.fname = "Caroline"
a.lname = "Holman"
a.email = "cholman@gmail.com"
a.password = "cholman"
a.bio = "I am Caroline and I am a psychologist in the Bronx."
a.location = "NYC"
end

#-------------- relationships ----------------

User.find(1).followeds << User.find(2)
User.find(1).followeds << User.find(3)
User.find(1).followeds << User.find(4)
User.find(1).followeds << User.find(5)

User.find(2).followeds << User.find(1)
User.find(2).followeds << User.find(3)
User.find(2).followeds << User.find(4)
User.find(2).followeds << User.find(5)

User.find(3).followeds << User.find(1)
User.find(3).followeds << User.find(2)
User.find(3).followeds << User.find(4)
User.find(3).followeds << User.find(5)

User.find(4).followeds << User.find(1)
User.find(4).followeds << User.find(2)
User.find(4).followeds << User.find(3)
User.find(4).followeds << User.find(5)

User.find(5).followeds << User.find(1)
User.find(5).followeds << User.find(2)
User.find(5).followeds << User.find(3)
User.find(5).followeds << User.find(4)



#------------ posts ------------------------

post_1 = Post.create do |p|
p.user_id = user_1
p.body = "I love this blog!"
end

post_2 = Post.create do |p|
p.user_id = user_1 
p.body = "So many new creations from Great Chefs!"
end

post_3 = Post.create do |p|
p.user_id = user_2
p.body = "Mario Batali is giving a demonstration this weekend at the botanical Gardens!"
end

post_4 = Post.create do |p|
p.user_id = user_2
p.body = "Daniel loses a Michelin Star this week!"
end

post_5 = Post.create do |p|
p.user_id = user_3
p.body = "Aquavit gets upgraded to two Michelin star status!"
end

post_6 = Post.create do |p|
p.user_id = user_3
p.body = "I hate @Aquavit twice last yeat and the diner menu is fantastic!"
end

post_7 = Post.create do |p|
p.user_id = user_4
p.body = "Who do you guys think will win Hell's Kitchen this year?!"
end

post_8 = Post.create do |p|
p.user_id = user_4
p.body = "I put my money on Jason!"
end

post_9 = Post.create do |p|
p.user_id = user_5
p.body = "Kale is just a phase. People will get over it!"
end

post_10 = Post.create do |p|
p.user_id = user_5
p.body = "New spots in Brooklyn make Great food at affordable price. HINT: CAFE MOGADOR!"
end


