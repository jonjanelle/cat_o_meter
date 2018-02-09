# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# names = ["Kim Smith", "Jerry Butt", "Fig Newton", "Taco Toaster"]
emails = ["test1@gmail.com", "test2@gmail.com", "test3@gmail.com", "test4@gmail.com"]
#
# (0...4).each do |i|
#   n = names[i].split(" ")
#   u = User.create(email: emails[i], first_name: n[0], last_name: n[1], organization: true, password: "password")
# end

users = User.where(email: email)
descriptions = ["Hats Needed!", "Gloves for Shelter", "Canned Food for Pantry", "Educational toys wanted"]
descriptions.each_with_index do |desc, index|
  DonationRequest.create(user_id: users[index].id, description: desc, contact_first: users[index].first_name, contact_last: users[index].last_name, contact_email: email[index])
end
