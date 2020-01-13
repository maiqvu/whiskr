User.destroy_all

u1 = User.create! name: "mia", email: "whiskr@whiskr.com", password: "Wh1skr", bio: "whiskr overlord", admin: true
u2 = User.create! name: "Pawdry Hepburn", email: "hepburn@mail.com", password: "Wh1skr", bio: "If you're into bad girls, swipe left because I'm a good girl."
u3 = User.create! name: "Leopawrdo DiCatrio", email: "sinker@titanic.com", password: "Wh1skr", bio: "Total stud! Swipe right or you'll regret for life."
u4 = User.create! name: 'Jude Paw', email: "drwatson@bakerst.com", password: "Wh1skr", bio: "Enjoy long walks to the kitchen to find cheese."
u5 = User.create! name: 'Oprah Whisker', email: "ladyo@harpo.com", password: "Wh1skr", bio: "World famous. Mogul. Alpha female."

print "Done creating #{User.count} users: "
puts "#{User.pluck(:name).join(', ')}."