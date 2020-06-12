# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



puts 'Deleting events...'
Event.destroy_all

puts 'Deleting users...'
User.destroy_all

puts 'Creating users...'
@shogo = User.create!(
  name: 'Shogo',
  email: 'shogo@gmail.com',
  password: '123456'
)

puts 'Creating events...'
Event.create!(
  name: 'test',
  user: @shogo
)


news_api_key = ENV["NEWS_API_KEY_ID"]
uri1 = URI.parse("https://newsapi.org/v2/sources?language=en&apiKey=#{news_api_key}")
json1= Net::HTTP.get(uri1)
publishers_to_rb = JSON.parse(json1)
publishers = publishers_to_rb["sources"]
publishers.each do |data|
  Event.create!(source_id: data['id'],name: data['name'], description: data['description'], name:data['name'], url:data['url'], language:data['language'], country:data['country'],category:data['category'])
end
