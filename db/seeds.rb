# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create first_name: 'Charley', last_name: 'DAVID', email: 'charley.david@y-nov.com', password: 'test', password_confirmation: 'test'
User.create first_name: 'Jonathan', last_name: 'MARROT', email: 'jonathan.marrot@y-nov.com', password: 'test', password_confirmation: 'test'
User.create first_name: 'Damien', last_name: 'LAJARRETIE', email: 'damien.lajarretie@y-nov.com', password: 'test', password_confirmation: 'test'

Event.create! user: User.first, members: User.all, name: 'Fils rouge !', description: 'Un projet sans intérêts ...', start_at: 1.hour.from_now, end_at: 2.hours.from_now, event_type: 'meeting', recurrent: false
