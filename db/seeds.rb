# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |n|
  user = User.create(
    name: "user#{n+1}",
    email: "text#{n+1}@test.com",
    password: "123456",
  )
  
  if user.valid?
    puts "User #{n+1} created"
  else
    puts "Error creating user #{n+1}: #{user.errors.full_messages.join(', ')}"
  end
end

User.all.each do |user|
  5.times do |n|
    book = Book.create(
      title: "本#{n+1}",
      body: "サンプル投稿です#{n+1}",
      user_id: user.id,
      created_at: Time.current - rand(10).day
      )
  if book.valid?
    puts "Book for User #{user.id} created"
  else
    puts "Error creating book for User #{user.id}: #{book.errors.full_messages.join(', ')}"
  end
end
end