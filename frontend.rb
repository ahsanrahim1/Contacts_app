require "unirest"


system "clear"
puts "Welcome to the contacts app"
puts "To view all contacts press 1"
puts "To view a certain contact press 2"
puts "To create a new contact press 3"
puts "To update a contact press 4"
puts "To delete a contact press 5"
input_key = gets.chomp
if input_key == "1"
  response = Unirest.get("http://localhost:3000/v2/contacts") 
  contacts = response.body
  puts JSON.pretty_generate(contacts) 

elsif input_key == "2"
  print "Enter contact id :"
  contact_id = gets.chomp
  response = Unirest.get("http://localhost:3000/v2/contacts/#{contact_id}")
  contact = response.body
  puts JSON.pretty_generate(contact)

elsif input_key == "3"
  params = {}
  print "Enter first name :"
  params["input_name"] = gets.chomp
  print "Enter last name :"
  params["input_last_name"] = gets.chomp
  print "Enter email :"
  params["input_email"] = gets.chomp
  print "Enter phone number :"
  params["input_phone_number"] = gets.chomp

  response = Unirest.post("http://localhost:3000/v2/contacts", parameters:params)
  contact = response.body
  puts JSON.pretty_generate(contact)
 elsif input_key == "4"
   print "Enter contact id :"
   contact_id = gets.chomp
   params = {}
   print "Enter first name :"
   params["input_name"] = gets.chomp
   print "Enter last name :"
   params["input_last_name"] = gets.chomp
   print "Enter email :"
   params["input_email"] = gets.chomp
   print "Enter phone number :"
   params["input_phone_number"] = gets.chomp
   params.delete_if { |_key, value| value.empty? }
   response = Unirest.patch("http://localhost:3000/v2/contacts/#{contact_id}",parameters:params)
   contact = response.body
   puts JSON.pretty_generate(contact)
 elsif input_key == "5" 
   print "Enter contact id :"
   contact_id = gets.chomp
   response = Unirest.delete("http://localhost:3000/v2/contacts/#{contact_id}")
   body = response.body
   puts JSON.pretty_generate(body)
     
end

