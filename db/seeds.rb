['Books', 'TV Shows', 'Movies', 'Clothes', 'Music', 'Food'].each do |category|
  Category.create(name: category)
end

# Create users
20.times do
  User.create(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.email,
              password: '12345678',
              password_confirmation: '12345678'
  )
  puts "Product created!"
end
puts Cowsay.say 'Created 100 user', :beavis


# Create Products
100.times do
  category = Category.all.sample
  user = User.all.sample

  p = Product.create(title: Faker::Hacker.say_something_smart,
                     description: Faker::Hipster.paragraph,
                     price: rand(100),
                     category_id: category.id,
                     user_id: user.id
  )
  puts "Product created!"
end
puts Cowsay.say 'Created 100 products', :cow

# Create Reviews
Product.all.each do |product|
  5.times do
    user = User.all.sample

    product.reviews.create(rating: rand(6),
                           body: Faker::Hipster.paragraph,
                           user_id: user.id
    )
    puts "Review created!"
  end
end
puts Cowsay.say 'Created lots of reviews', :cow
