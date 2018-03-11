class V2::ContactsController < ApplicationController
  # def peter
  #   contact=Contact.first
  #   render json:{
  #     first_name:contact.first_name ,
  #     last_name:contact.last_name ,
  #     email:contact.email ,
  #     phone_number:contact.phume_number}
  # end

  # def bruce
  #   contact=Contact.second
  #   render json:{
  #     first_name:contact.first_name ,
  #     last_name:contact.last_name ,
  #     email:contact.email ,
  #     phone_number:contact.phume_number}
  # end

  # def clark
  #   contact=Contact.last
  #   render json:{
  #     first_name:contact.first_name ,
  #     last_name:contact.last_name ,
  #     email:contact.email ,
  #     phone_number:contact.phume_number}
  # end

  def index 
    contacts = Contact.all 
    render json: contacts.as_json
  end

  def show
    contact_id = params["id"]
    contact = Contact.find_by(id: contact_id)
    render json: contact.as_json
  end

  def create
    contact = Contact.new(
      first_name: params["input_name"],
      last_name: params["input_last_name"],
      email: params["input_email"],
      phume_number: params["input_phone_number"]
    )

    contact.save
    render json: contact.as_json
  end

  def update
    contact_id = params["id"]
    contact = Contact.find_by(id: contact_id)
    contact.first_name = params["input_name"] || contact.first_name
    contact.last_name = params["input_last_name"] ||contact.last_name
    contact.email = params["input_email"] ||contact.email
    contact.phume_number = params["input_phone_number"] ||contact.phume_number
    contact.save
    render json:contact.as_json
  end

  def destroy
    contact_id = params["id"]
    contact = Contact.find_by(id: contact_id)
    contact.destroy
    render json: {message: "contact deleted"}
  end



end
