# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
  ballot_name: "Predisident/ Vice President",
  candidates: "Devon Neilson and Ariel Mota Alves",
  rank: "1st",
  category: "student")

Ballot.create!(
  ballot_name: "SAC Coordinator",
  candidates: "Carrie Sayre, Lily Nelson",
  rank: "1st, 2nd",
  category: "student")

Ballot.create!(
  ballot_name: "SOC Coordinator",
  candidates: "Claire Shaw",
  rank: "1st",
  category: "student")

Ballot.create!(
  ballot_name: "Student Life Senator",
  candidates: "Jessica Hollister",
  rank: "1st",
  category: "student")

Ballot.create!(
  ballot_name: "VN Coordinator",
  candidates: "Jonah Schmitz, Katie DeFoe",
  rank: "1st, 2nd",
  category: "student")

Ballot.create!(
  ballot_name: "ADC Coordinator",
  candidates: "Arden Sasak",
  rank: "1st",
  category: "student")

Ballot.create!(
  ballot_name: "BORSC Coordinator",
  candidates: "Emer Kate, Melie Ekunno",
  rank: "1st, 2nd",
  category: "student")

Ballot.create!(
  ballot_name: "Gender and Sexuality Senator",
  candidates: "Maggie Upjohn",
  rank: "1st",
  category: "student")

Ballot.create!(
  ballot_name: "Curriculum Senator",
  candidates: "Israa Khalifa, Saliem Hashel, Bobbie Isbell",
  rank: "1st, 2nd, 3rd",
  category: "student")

Ballot.create!(
  ballot_name: "DISC Coordinator",
  candidates: "Chelsey Mbachu",
  rank: "1st",
  category: "student")

Ballot.create!(
  ballot_name: "Environmental Senator",
  candidates: "David Howard, Isabel Istephanous, Dana Pflughoeft, Terence Kwok Choon",
  rank: "1st, 2nd, 3rd, 4th",
  category: "student")

Ballot.create!(
  ballot_name: "Inter-Campus Liason",
  candidates: "Will Jadkowski",
  rank: "1st",
  category: "student")

Ballot.create!(
  ballot_name: "International Student Senator",
  candidates: "Zhanat Seitkuzhin, Mariam Mekha, Rafa Al Helal",
  rank: "1st, 2nd, 3rd",
  category: "international")

Ballot.create!(
  ballot_name: "Lion's Pause Co-Coordinators",
  candidates: "Silas Guelzow and Julia Pritchard",
  rank: "1st",
  category: "student")

Ballot.create!(
  ballot_name: "MEC Coordinator",
  candidates: "Holly Smith, Aleksandr Smirnov, Ashton Balder, Alyson Brinker",
  rank: "1st, 2nd, 3rd, 4th",
  category: "student")

Ballot.create!(
  ballot_name: "Multicultural Senator",
  candidates: "Jacqueline Guadalupe Guerrero",
  rank: "1st",
  category: "mcd")

Ballot.create!(
  ballot_name: "PAC Coordinator",
  candidates: "Or Pansky",
  rank: "1st",
  category: "student")
