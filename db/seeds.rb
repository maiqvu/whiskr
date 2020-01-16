User.destroy_all

u1 = User.create! name: "mia", email: "whiskr@whiskr.com", password: "Wh1skr", bio: "whiskr overlord", address: "1 Market St, Sydney", admin: true
u2 = User.create! name: "Pawdry Hepburn", email: "hepburn@mail.com", password: "Wh1skr", bio: "If you're into bad girls, swipe left because I'm a good girl.", address: "22 Central Ave, Manly 2095"
u3 = User.create! name: "Leopawrdo DiCatrio", email: "sinker@titanic.com", password: "Wh1skr", bio: "Total stud! Swipe right or you'll regret for life.", address: "15 Broadway, Ultimo 2007"
u4 = User.create! name: 'Jude Paw', email: "drwatson@bakerst.com", password: "Wh1skr", bio: "Enjoy long walks to the kitchen to find cheese.", address: "1 York St, Sydney"
u5 = User.create! name: 'Oprah Whisker', email: "ladyo@harpo.com", password: "Wh1skr", bio: "World famous. Mogul. Alpha female.", address: "30 Parke St, Katoomba NSW 2780"

print "Done creating #{User.count} users: "
puts "#{User.pluck(:name).join(', ')}."



Photo.destroy_all

p1 = Photo.create! url: 'https://cache.desktopnexus.com/thumbseg/1254/1254030-bigthumbnail.jpg'
p2 = Photo.create! url: 'https://cdns.klimg.com/merdeka.com/i/w/news/2012/05/15/44562/670x335/10-tips-unik-perawatan-kucing-rev-1.jpg'
p3 = Photo.create! url: 'https://i.pinimg.com/474x/52/d9/09/52d9092b83188e67b97058e20851c1d3.jpg'
p4 = Photo.create! url: 'https://pngimage.net/wp-content/uploads/2018/06/gato-saltando-png.png'
p5 = Photo.create! url: 'https://ca-times.brightspotcdn.com/dims4/default/33c083b/2147483647/strip/true/crop/1611x906+0+0/resize/840x472!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2Ffd%2Fef%2F05c1aab3e76c3d902aa0548c0046%2Fla-la-hm-pet-issue-18-jpg-20150615'
p6 = Photo.create! url: 'https://i.imgur.com/4L4lteV.jpg'

puts "Done creating #{Photo.count} photos."


# USER -> PHOTO association
u1.photos << p1
u2.photos << p2
u3.photos << p3 << p6
u4.photos << p4
u5.photos << p5

puts "Photos of #{User.second.name}: #{User.second.photos.pluck(:id).join(', ')}."




Match.destroy_all

m1 = Match.create! liker_id: u1.id, liked_id: u3.id
m2 = Match.create! liker_id: u3.id, liked_id: u1.id
m3 = Match.create! liker_id: u4.id, liked_id: u1.id

puts "Done creating #{Match.count} matches."



Message.destroy_all

msg1 = Message.create! body: "Hi hello", sender_id: u1.id, recipient_id: u2.id
msg2 = Message.create! body: "How are you?", sender_id: u2.id, recipient_id: u1.id
msg3 = Message.create! body: "Nice weather today.", sender_id: u1.id, recipient_id: u2.id
msg4 = Message.create! body: "Lalala?", sender_id: u1.id, recipient_id: u5.id

puts "Done creating #{Message.count} messages."