# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'json'

file_path = Rails.root.join('./', 'data.json')

file = File.read(file_path)
products = JSON.parse(file)['grocery']

products.each do |product|
  Product.create!(
    productName: product['productName'],
    price: product['price'],
    stock: product['stock'],
    image_url: product['image_url'],
    productDescription: product['productDescription'],
    favorite: product['favorite']
  )
end