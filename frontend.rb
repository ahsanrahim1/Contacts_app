require "unirest"


system "clear"
puts "Welcome to the contacts app"
puts "To view all contacts press 1"
puts "To view a certain contact press 2"
puts "To create a new contact press 3"
input_key = gets.chomp
if input_key == "1"
  response = Unirest.get("http://localhost:3000/v2/contact") 
  contacts = response.body
  puts JSON.pretty_generate(contacts) 

elsif input_key == "2"
  print "Enter contact id :"
  contact_id = gets.chomp
  response = Unirest.get("http://localhost:3000/v2/contact/#{contact_id}")
  contact = response.body
  puts JSON.pretty_generate(contact)
    
end

