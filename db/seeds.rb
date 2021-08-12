puts "Clearing old data..."
Program.destroy_all
Fan.destroy_all
Register.destroy_all

puts "Seeding program..."
programs = ["Spiderman No Way Home", "Shazam 2", "Star Wars", "Ghostbusters Alterlife"]

# Create sample programs
programs.each do |program|
    Program.create(name: program, 
      desc: "An inside look at the highly-anticipated upcoming film Snake Eyes: G.I Joe Origins—with special content and exclusive interviews",
      sponsor: "Marvel", 
      quantity_fan: 10, 
      sits_available: 10,
      room: Faker::Number.between(from: 1, to: 10), 
      date: "08/30/2021",
      startTime: DateTime.now,
      endTime: DateTime.now,
      image_url: "https://image.shutterstock.com/z/stock-photo-moscow-russia-march-marvel-logo-in-hamleys-store-marvel-comics-group-is-a-publisher-of-1073397620.jpg",
      status: 1)
end

puts "Seeding fan..."
# Create 10 random Fans
10.times do
    Fan.create(name: Faker::Name.name, phone_number: Faker::PhoneNumber.cell_phone, email: Faker::Internet.email)
end

puts "Seeding registers..."
# Create 20 random registers
20.times do
  # Get a Fan instance:
  fan_id = Fan.ids.sample
  # Get a program instance:
  program_id = Program.ids.sample

  # TODO: create registers! Remember, a registers belongs to a Fan
  # and a register belongs to a program.
  Register.create(program_id: program_id, fan_id: fan_id)
end

puts "Done!"