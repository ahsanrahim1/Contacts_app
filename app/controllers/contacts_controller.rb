class ContactsController < ApplicationController
  def peter
    contact=Contact.first
    render json:{
      first_name:contact.first_name ,
      last_name:contact.last_name ,
      email:contact.email ,
      phone_number:contact.phume_number}
  end

  def bruce
    contact=Contact.second
    render json:{
      first_name:contact.first_name ,
      last_name:contact.last_name ,
      email:contact.email ,
      phone_number:contact.phume_number}
  end

  def clark
    contact=Contact.last
    render json:{
      first_name:contact.first_name ,
      last_name:contact.last_name ,
      email:contact.email ,
      phone_number:contact.phume_number}
  end
end
