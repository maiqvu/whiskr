User.destroy_all

u1 = User.create! name: "mia", email: "whiskr@whiskr.com", bio: "whiskr overlord"
u2 = User.create! name: "Pawdry Hepburn", email: "hepburn@mail.com", bio: "If you're into bad girls, swipe left because I'm a good girl."
u3 = User.create! name: "Leopawrdo DiCatrio", email: "sinker@titanic.com", bio: "Total stud! Swipe right or you'll regret for life."
u4 = User.create! name: 'Jude Paw', email: "drwatson@bakerst.com", bio: "Enjoy long walks to the kitchen to find cheese."
u5 = User.create! name: 'Oprah Whisker', bio: "World famous. Mogul. Alpha female."

print "Done creating #{User.count} users: "
puts "#{User.pluck(:name).join(', ')}."