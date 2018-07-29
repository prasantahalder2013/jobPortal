# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(fname: 'Admin', lname: 'Admin', email: 'admin@gmail.com', password: 'abc123');

org = Organization.create!(name: 'Organization1', address: 'Kolkata');
OrgAdmin.create!(fname: 'org1', lname: 'user1', email: 'orguser1@gmail.com', password: 'abc123', organization: org);

org = Organization.create!(name: 'Organization2', address: 'Kolkata');
OrgAdmin.create!(fname: 'org2', lname: 'user2', email: 'orguser2@gmail.com', password: 'abc123', organization: org);
