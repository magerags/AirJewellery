# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Jewellery.destroy_all
User.destroy_all

fe = ['gold', 'silver', 'bronze', 'platinum', 'stainless steel']
se = ['ring', 'necklace', 'bracelet', 'anklet', 'pendant', 'watch']
te = ['diamonds', 'emeralds', 'rubies', 'white gold elements', 'a diamond']

# https://loremflickr.com/400/400/jewellery

tom = User.create!(email: 'tom@tom.com', password: '123456')

20.times do
  Jewellery.create!(
    name: "#{fe.sample} #{se.sample} with #{te.sample}",
    description: Faker::Lorem.sentence(word_count: 20),
    price: rand(0..100),
    # photo: 'https://loremflickr.com/400/400/jewellery',
    user: tom
  )
end
