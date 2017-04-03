['Books', 'TV Shows', 'Movies', 'Clothes', 'Music', 'Food'].each do |category|
  Category.create(name: category)
end

category = Category.all.sample

100.times do
  Product.create  title: Faker::Superhero.name,
                  description: Faker::RickAndMorty.quote,
                  price: rand(1000),
                  category_id: category.id

end

products = Product.all

products.each do |q|
  rand(0..10).times do
    q.reviews.create({
        body: Faker::Hipster.paragraph,
        rating: rand(1..5)
      })
  end
end

reviews_count = Review.count

puts Cowsay.say 'Created 100 Products', :dragon
puts Cowsay.say "Created #{reviews_count} reviews", :ghostbusters
