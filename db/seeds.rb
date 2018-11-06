# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Landlord.create([{name: "Jonathan", phone: "6176105413", username: "jonwihl", password: "secret", password_confirmation: "secret"},
                {name: "AJ", phone: "5083617728", username: "arnavj1", password: "secret", password_confirmation: "secret"},
                {name: "Kevin  ", phone: "7178285463", username: "kevin1", password: "secret", password_confirmation: "secret"},
                {name: "Lou", phone: "8820914372", username: "louis", password: "secret", password_confirmation: "secret"},
                {name: "Cindy", phone: "4123456981", username: "cindysun", password: "secret", password_confirmation: "secret"}])

Property.create([{addr_line1: "5445 Wilkins Ave", city: "Pittsburgh", state: "PA", zipcode: "15289", rent: "3452", start_date: Date.current, landlord_id: 1},
                {addr_line1: "100 Beeler St", city: "Pittsburgh", state: "PA", zipcode: "15289", rent: "2001", start_date: Date.current, landlord_id: 1},
                {addr_line1: "5000 Forbes Ave", city: "Pittsburgh", state: "PA", zipcode: "15289", rent: "900", start_date: Date.current, landlord_id: 2},
                {addr_line1: "54 Stevens St", city: "Pittsburgh", state: "PA", zipcode: "15289", rent: "1000", start_date: Date.current, landlord_id: 3},
                {addr_line1: "5423 Wilkins Ave", city: "Pittsburgh", state: "PA", zipcode: "15289", rent: "3810", start_date: Date.current, landlord_id: 4},
                {addr_line1: "4123 Wilkins Ave", city: "Pittsburgh", state: "PA", zipcode: "15289", rent: "1023", start_date: Date.current, landlord_id: 4},
                {addr_line1: "1030 Wilkins Ave", city: "Pittsburgh", state: "PA", zipcode: "15289", rent: "3452", start_date: Date.current, landlord_id: 4},
                {addr_line1: "102 Marcus Ave", city: "Pittsburgh", state: "PA", zipcode: "15289", rent: "3452", start_date: Date.current, landlord_id: 5}])


# Tenant.create([{name: "Jonathan", phone: "6176105413", username: "jonwihl", password: "secret", password_confirmation: "secret", property_id: 1}])





# Maintenance.create([{title: "Broken Sink", description: "Sink is not working.", created_on: "11/1/2018", tenant_id: 1, property_id: 1,
#                     }])