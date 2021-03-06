require "unirest"

puts "login"
print "email :"
email = gets.chomp
print "password :"
password = gets.chomp 
response = Unirest.post(
  "http://localhost:3000/user_token",
  parameters: {
    auth: {
      email: "#{email}",
      password: "#{password}"
    }
  }
)

# Save the JSON web token from the response
jwt = response.body["jwt"]
# Include the jwt in the headers of any future web requests
Unirest.default_header("Authorization", "Bearer #{jwt}")

system "clear"
p jwt
puts "Welcome to the contacts app"
puts "To view all contacts press 1"
puts "To search a contact by name press #"
puts "To view a certain contact press 2"
puts "To create a new contact press 3"
puts "To update a contact press 4"
puts "To delete a contact press 5"
puts "to sign up enter [signup]"
input_key = gets.chomp
if input_key == "1"
  response = Unirest.get("http://localhost:3000/v2/contacts") 
  contacts = response.body
  puts JSON.pretty_generate(contacts) 

elsif input_key == "#"
  params = {}
  print "Enter name : "
  params["search_term"] = gets.chomp
  response = Unirest.get("http://localhost:3000/v2/contacts?query=#{params["search_term"]}") 
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
  print "Enter middle name :"
  params["input_middle_name"] = gets.chomp
  print "Enter bio :"
  params["input_bio"] = gets.chomp
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
   print "Enter middle name :"
   params["input_middle_name"] = gets.chomp
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
 elsif input_key == "signup"
   params = {}
   print "Enter Name:"
   params["name"]=gets.chomp
   print "Enter email address:"
   params["email"]=gets.chomp
   print "password :"
   params["password"]=gets.chomp
   print "Confirm password :"
   params["password_confirmation"] = gets.chomp


   response = Unirest.post("http://localhost:3000/v2/user", parameters: params)
   p response.body 

     
end

