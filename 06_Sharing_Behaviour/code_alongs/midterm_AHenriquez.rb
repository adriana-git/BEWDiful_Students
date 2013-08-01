require 'json'
require 'rest-client'
require 'net/http'

def show_message(message)
  puts message
end

def get_input
  gets.chomp 
end

def get_choice
  gets.to_i
end

def generate_json(city)
  city_url = "http://api.flickr.com/services/rest/?format=json&nojsoncallback=1&method=flickr.photos.search&tags=#{city}&tag_mode=all&api_key=62ed9b3c3446bd0e761414b999310390"
  city_resp = Net::HTTP.get_response(URI.parse(city_url))
  city_data = city_resp.body 
  city_ruby = JSON.parse(city_data)  
end

def evaluate_destination(city1, city2, profile)
  #Method will return 1 for city1, 2 for city2
  #Value is decided based on whether user likes bustling spots and quieter spots
  #Number of pics that is returned from Flickr API determines whether city is highly photographed, i.e. highly visited or not

  if profile == 1 && city1 > city2
    1 
  elsif profile == 1 && city1 < city2
    2
  elsif profile == 2 && city1 > city2
    2
  elsif profile == 2 && city1 < city2
    1
  end
end


show_message("It's Flickr Time! Let's use shutterbug stats to choose a vacation spot")
show_message("Let's figure out your style. Enter 1 if you like bustling spots or Enter 2 if you like quieter spots:")

user_type = get_choice

show_message("Cool. Now enter your first city pick:")

first_city = get_input

show_message("Now enter your second city pick:")

second_city = get_input

first_city_json = generate_json(first_city)
second_city_json = generate_json(second_city) 

city_choice = evaluate_destination(first_city_json["photos"]["total"], second_city_json["photos"]["total"], user_type)
 
puts "Your next city should be " + (city_choice == 1 ? first_city : second_city)

puts "Goodbye!"

puts "Thank you for using Shutterbug!"

