# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_list = JSON.parse(open(url).read)['drinks']
doses_list = %w[5cl 10cl 15cl 20cl]
cocktails_list = ['mojito',
                     'cuba libre',
                     'pina colada',
                     'margarita',
                     'bloody mary']
puts 'Cleaning database...'
Ingredient.destroy_all
10.times { Ingredient.create(name: ingredients_list.sample['strIngredient1']) }
cocktails_list.each do |cocktail|
  Cocktail.create(name: cocktail)
end
20.times do
  Dose.create(description: doses_list.sample,
            cocktail: Cocktail.where(name: cocktails_list.sample).take,
            ingredient: Ingredient.order('RANDOM()').first)
end
puts 'Seeding complete !'
