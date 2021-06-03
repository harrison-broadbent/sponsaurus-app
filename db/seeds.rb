# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'seeding database ...'

u = User.create! name: 'Harrison Broadbent',
                 email: 'thehungryhippo2002@gmail.com',
                 image: 'https://lh3.googleusercontent.com/a-/AOh14GhQxn7ZbKqI43tKvHU-QLFg7_MX_ONVwFMma8cS=s96-c',
                 provider: 'google_oauth2',
                 uid: '109913699064527981496',
                 password: 'secret123',
                 password_confirmation: 'secret123'

newsletter = u.newsletters.build name: 'SparseObfuscation',
                                 information: "Brain cells lost, every Wednesday.",
                                 statistics: "3% death rate. 55% grey matter loss. 100% bad."
newsletter.save

slot1 = newsletter.slots.build price_cents: 4900,
                               publish_date: Time.now + 2.days
slot2 = newsletter.slots.build price_cents: 4900,
                               publish_date: Time.now + 9.days

slot1.save
slot2.save

booking_for_slot1 = slot1.build_booking booker_name: 'Harrison Broadbent',
                                        booker_email: 'thehungryhippo2002@gmail.com',
                                        booker_billing_address: "37 Brockhoff Drive, Burwood",
                                        advert_title: "Self-serve email advertising bookings.",
                                        advert_description: "Sponsaurus is a self-serve booking manager, built for people that run email newsletters. \r\nTake the hassle out of booking advertising for your newsletters. \r\nSponsaurus provides a super simple way to manage your newsletter bookings. ",
                                        advert_url: 'https://sponsaurus.com',
                                        advert_image_url: "https://i.imgur.com/RtwpipO.jpeg"

booking_for_slot1.save



puts 'finished seeding ...'
