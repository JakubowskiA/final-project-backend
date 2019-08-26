u1 = User.create(name: "test", email: "test@test.com", password: "password")

e1 = Entry.create(pre_level: 8, stressors: "test", evaluation: "test", action: "test", positivity: "test", post_level: 4, user_id: u1.id)
