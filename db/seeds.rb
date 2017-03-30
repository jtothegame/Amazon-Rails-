100.times do
  Product.create  title: Faker::RockBand.name,
                  description: Faker::GameOfThrones.city,
                  price: rand(1000)
end

puts Cowsay.say 'Created 100 Products', :cow
