# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Landlord.create([{name: "Jonathan", phone: "6176105413", username: "jonwihl", password: "secret", password_confirmation: "secret"}])

Property.create([{addr_line1: "5445 Wilins", city: "Pittsburgh", state: "PA", zipcode: "15289", rent: "3452", start_date: Date.current, landlord_id: 1}])
Tenant.create([{name: "Jonathan", phone: "6176105413", username: "jonwihl", password: "secret", password_confirmation: "secret", property_id: 1}])
Maintenance.create([{title: "Broken Sink", description: "Sink is not working.", created_on: "11/1/2018", tenant_id: 1, property_id: 1,
                    }])