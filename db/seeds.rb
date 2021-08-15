puts "Clearing old data..."
Publisher.destroy_all
Character.destroy_all

puts "Seeding publisher..."
publishers = ["Marvel Comics", "DC Comics", "Dark Horse Comics", "Image Comics"]

# Create sample programs
publishers.each do |publisher|
  Publisher.create(name: publisher, 
      history: "DC Comics, Inc. is an American comic book publisher and the flagship unit of DC Entertainment,[4][5] a subsidiary of the Warner Bros. Global Brands and Experiences division of Warner Bros., which itself is a subsidiary of AT&T's WarnerMedia through its Studios & Networks division.",
      founded: 2021, 
      country: "United States", 
      image_url: "https://image.shutterstock.com/z/stock-photo-moscow-russia-march-marvel-logo-in-hamleys-store-marvel-comics-group-is-a-publisher-of-1073397620.jpg",
      wikipedia_url: "https://en.wikipedia.org/wiki/Marvel_Comics"
      )
end

puts "Seeding characters..."
# Create 10 random characters
10.times do
  Character.create(name: Faker::DcComics.hero, 
      creation: 2021,
      history: "Superman is a fictional character and a superhero who first appeared in American comic books published by DC Comics. The character was created by writer Jerry Siegel and artist Joe Shuster, and debuted in the comic book Action Comics #1 (cover-dated June 1938 and published April 18, 1938).",
      real_name: Faker::DcComics.name,
      alignment: "Good",
      image_url: "https://upload.wikimedia.org/wikipedia/en/3/35/Supermanflying.png",
      wikipedia_url: "https://en.wikipedia.org/wiki/Superman")
end

puts "Done!"