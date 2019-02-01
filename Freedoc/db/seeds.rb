# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

specialty_array = ['Family Physician', 'Internal Medicine Physician', 'Pediatrician',
                   'Gynecologist', 'Surgeon']
puts
puts '-' * 50
puts 'Création de 50 patients et médecins ...'
puts "Les 'specialty' sont parmi #{specialty_array.join(', ')}"
puts '-' * 50
puts

50.times do
  Doctor.create(first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                specialty: specialty_array.sample, zip_code: Faker::Address.zip_code)
  Patient.create(first_name: Faker::Name.first_name,
                 last_name: Faker::Name.last_name)
end

puts
puts '-' * 50
puts '50 patients et 50 docteurs ont été crées'
puts 'Création de 100 appointments ...'
puts '-' * 50
puts

100.times do
  offset = rand(Doctor.count)
  offset_patient = rand(Patient.count)
  Appointment.create(doctor: Doctor.offset(offset).first,
                     patient: Patient.offset(offset_patient).first,
                     date: Faker::Date.between(30.days.ago, Date.today))
end

puts
puts '-' * 50
puts '100 appointments crées'
puts '-' * 50
puts

puts 'Test sur 5 patients, docteurs, Appointments'
puts '=' * 50
5.times do
  offset = rand(Doctor.count)
  offset_patient = rand(Patient.count)
  offset_app = rand(Appointment.count)
  pa = Patient.offset(offset_patient).first
  d = Doctor.offset(offset).first
  a = Appointment.offset(offset_app).first
  puts '-' * 50
  puts 'Docteur tiré au sort'
  puts d
  puts
  puts "Nombre de patients : #{d.patients.length}"
  unless d.patients.empty?
    puts "Premier patient : first name: #{d.patients.first.first_name}, last name #{d.patients.first.last_name} "
  end
  puts
  puts '-' * 50
  puts 'Patient tiré au sort'
  puts pa
  puts
  puts "Nombre de docteurs vus : #{pa.doctors.length}"
  unless pa.doctors.empty?
    puts "Premier docteur : first name : #{pa.doctors.first.first_name}, last name : #{pa.doctors.first.last_name}, specialty : #{pa.doctors.first.specialty}, zip_code : #{pa.doctors.first.zip_code}  "
  end
  puts
  puts '-' * 50
  puts 'Appointment tiré au sort'
  puts a
  puts "son patient - prénom : #{a.patient.first_name}"
  puts "son médecin - prénom: #{a.doctor.first_name}"
  puts "sa date : #{a.date}"
  puts
end
puts 'END'
