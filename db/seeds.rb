# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Landlord.create([{name: "Jonathan", phone: "6176105413", username: "jonwihl", passoword_digest: "secret"}])
Tenant.create([{name: "Jonathan", phone: "6176105413", username: "jonwihl", passoword_digest: "secret"}])
Maintenance.create([{landlordID: 1,title: "Broken Sink", description: "Sink is not working.", created_on: "11/1/2018"
                    ])