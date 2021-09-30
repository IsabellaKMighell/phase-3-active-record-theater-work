Audition.destroy_all
Role.destroy_all

10.times do 
    Role.create(character_name:Faker::Superhero.name)
end

20.times do 
    Audition.create(actor: Faker::GreekPhilosophers.name, location: Faker::Space.planet, phone: Faker::Number.number(digits: 7), hired: [true, false].sample, role_id: Role.all.sample.id)
end

puts "Seeding complete"