# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

100.times do
  Student.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    active: rand > 0.2,
  )

  Award.create(
    student: Student.all.sample,
    competition: Faker::Educator.university,
    placement: "#{rand(1..4)} Place",
    date: Date.today - rand(0..365)
  )
end

# semester and calendar_listings
['Fall 2018', 'Spring 2019', 'Fall 2019', 'Fall 2020'].each do |semester|
  Semester.create(name: semester)
end

date = Date.today
['Fall 2018', 'Spring 2019', 'Fall 2019', 'Fall 2020'].each do |semester_name|
  semester = Semester.find_by_name(semester_name)

  rand(8..12).times do |i|
    date += i
    CalendarListing.create(
      semester: semester,
      start_date: date += i,
      end_date: (rand > 0.5 ? date += i : nil),
      description: Faker::Zelda.game
    )
  end
end
