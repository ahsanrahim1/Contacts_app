require "unirest"

while
system "clear"
puts "Choose contact Name"
puts "[1] Peter"
puts "[2] Batman"
puts "[3] Superman"


input_option = gets.chomp
if input_option  == "1"
  response= Unirest.get("http://localhost:3000/v1/peter_url")
  contact=response.body
  puts JSON.pretty_generate(contact)
elsif input_option == "2"
  response= Unirest.get("http://localhost:3000/v1/bruce_url")
  contact=response.body
  puts JSON.pretty_generate(contact)


elsif input_option == "3"
  response = Unirest.get("http://localhost:3000/v1/clark_url")
  contact=response.body
  puts JSON.pretty_generate(contact)
  
end 

puts "Press q if you would like to quit"
puts "else press any key"
input_key=gets.chomp
if input_key == "q"
  break
end
 
end
