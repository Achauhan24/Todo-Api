# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Todo.create!(title: "need to work on API",
	completed: true,
	order: 1)

10.times do |n|
	title=Faker::Lorem.sentence(5)
	completed=Faker::Boolean.boolean(0.2)
	order=Faker::Number.between(1,15)
	Todo.create!(title: title,
		completed: completed,
		order: order)
end

User.create(name: 'bugs', email: 'bugs@rubyplus.com', password: 'qwertyu')
User.create(name: 'daffy', email: 'daffy@rubyplus.com', password: 'qwertyuiop')