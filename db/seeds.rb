# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

1.upto(25) do |i|
  Task.create(title: "task_#{i}", status: 'new', description: "lorem i ps umkdfklsd jfkl sdj fdsjf ksdfj")
end
