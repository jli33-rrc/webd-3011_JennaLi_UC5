# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"
require "csv"

# # Part 1, Step 9: Create 676 products
# 676.times do
#     Product.create!(
#         title: Faker::Commerce.product_name,
#         description: Faker::Lorem.sentence(word_count: 10),
#         price: Faker::Commerce.price(range: 10.0..500.0),
#         stock_quantity: Faker::Number.between(from: 1, to: 100)
#     )
# end

# Part 2, Step 7
# Clear existing products and categories data to prevent duplicates
Product.delete_all
Category.delete_all

# Load CSV data
csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)
products = CSV.parse(csv_data, headers: true)

products.each do |row|
    # Get category name from CSV
    category_name = row['category']

    # Find or create category
    category = Category.find_or_create_by(name: category_name)

    # Create product associated with category
    Product.create!(
        title: row['name'],
        description: row['description'],
        price: row['price'],
        stock_quantity: row['stock quantity'],
        category: category
    )
end

puts "Seeded #{Category.count} categories and #{Product.count} products."

