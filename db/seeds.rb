a1 = Author.create(name: Faker::Book.author, bio: Faker::Lorem.paragraph)
a2 = Author.create(name: Faker::Book.author, bio: Faker::Lorem.paragraph)
a3 = Author.create(name: Faker::Book.author, bio: Faker::Lorem.paragraph)
a4 = Author.create(name: Faker::Book.author, bio: Faker::Lorem.paragraph)

10.times do
    Book.create(
        title: Faker::Book.title,
        year: [2012, 2015, 2018, 2021, 1990, 3000].sample,
        pages: [300, 232, 654, 765, 183, 342].sample,
        rating: (0..10).to_a.sample,
        read: [true, false].sample,
        author: [a1, a2, a3, a4].sample
    )
end