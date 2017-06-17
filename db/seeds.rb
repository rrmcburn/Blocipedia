

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
    body:   RandomData.random_paragraph,
    private: false 
  )
end

wikis = Wiki.all

#Admin user
user = User.second
user.update_attributes!(
  email: 'rrmcburn@gmail.com',
  password: 'ryanryan',
  role:     'admin'
)

#Premium user
user = User.last
user.update_attributes!(
  email: 'premium@gmail.com',
  password: 'premium',
  role:     'premium'
)

#standard user
user = User.first
user.update_attributes!(
  email: 'standard@gmail.com',
  password: 'standard',
  role:     'standard'
)

puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"
