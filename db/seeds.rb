

# Create Users
8.times do
  User.create!(
  email:    RandomData.random_email,
  password: RandomData.random_sentence
  )
end
users = User.all

# Create Wikis
50.times do
  Wiki.create!(
    user:   users.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end

wikis = Wiki.all

#Admin user
user = User.first
user.update_attributes!(
  email: 'rrmcburn@gmail.com',
  password: 'ryanryan',
  role:     'admin'
)

#standard user
user = User.first
user.update_attributes!(
  email: 'test@gmail.com',
  password: 'testtest',
  role:     'standard'
)

puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"
