# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

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

# nytimes
url1 = "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=election&api-key=KWwSqakiTpXxhKaIS8211GJYbEeKgWCZ"
ny_serialized = open(url1).read
election_articles = JSON.parse(ny_serialized)
election_articles["response"]["docs"].each do |article|
  Event.create!(
    name: "test",
    user: @shogo,
    content: article["lead_paragraph"]
  )
end

# ft times
url2 = "https://api.ft.com/content/notifications?apiKey=59cbaf20e3e06d3565778e7b7b9ba4f2d4ed4887b6861c77c7eda766&since=2020-06-12T13:50:00.000Z"
ft_serialized = open(url2).read
recent_articles = JSON.parse(ft_serialized)
recent_articles["notifications"].each do |article|
  Event.create!(
    name: "test",
    user: @shogo,
    content: article["apiUrl"][0..7] + article["apiUrl"][12..-1]
  )
end

# news_api_key = ENV["NEWS_API_KEY_ID"]
# uri1 = URI.parse("https://newsapi.org/v2/sources?language=en&apiKey=#{news_api_key}")
# json1= Net::HTTP.get(uri1)
# publishers_to_rb = JSON.parse(json1)
# publishers = publishers_to_rb["sources"]
# publishers.each do |data|
#   Event.create!(source_id: data['id'],name: data['name'], description: data['description'], name:data['name'], url:data['url'], language:data['language'], country:data['country'], category:data['category'])
# end
