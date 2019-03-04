# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "admin",
             email: "admin@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

# 20.times do |time|
#   User.create!(
#     name: "person#{time}",
#     email: "person#{time}@gmail.com",
#     password: "changeme!",
#     password_confirmation: "changeme!",
#     admin: false
#   )
# end

Ballot.create!(
  ballot_name: "People vote test",
  candidates: "bob box, susan small, merry christmas, why me",
  rank: "1st, 2nd, 3rd, 4th")

# for use in User.all
#     6.times do |time|
#       Vote.create!(
#         user_id: use.id,
#         candidate_name: [0,1,2,3].sample,
#         rank: [0,1,2,3].sample,
#         ballot_id: 1)
#   end
# end
