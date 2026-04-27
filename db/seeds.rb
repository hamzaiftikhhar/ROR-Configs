# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#write hte seed data for products table. This will create 10 products with random names and prices. The find_or_create_by! method is used to ensure that if a product with the same name already exists, it won't create a duplicate record.
10.times do
  Product.find_or_create_by!(name: Faker::Commerce.product_name) do |product|
    product.featured = [true, false].sample
    product.name = Faker::Commerce.product_name
    product.description = Faker::Lorem.sentence(word_count: 10)
    product.inventory_count = rand(1..100)
  end
end

