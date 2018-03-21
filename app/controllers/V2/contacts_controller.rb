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
    # contacts = Contact.all 
    if current_user
      contacts = current_user.contacts.order(:id)
      search_term = params[:query]
      if search_term

        contacts = contacts.where("first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ? OR phume_number ILIKE ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
      end
      render json: contacts.as_json
    else 
      render json: []
    end
  end

  def show
    contact_id = params["id"]
    contact = Contact.find_by(id: contact_id)
    render json: contact.as_json
  end

  def create
    if current_user
    contact = Contact.new(
      first_name: params["input_name"],
      last_name: params["input_last_name"],
      email: params["input_email"],
      phume_number: params["input_phone_number"],
      bio: params["input_bio"],
      middle_name: params["input_middle_name"],
      user_id: current_user.id
    )

    contact.save
    render json: contact.as_json
    else 
      render json: {message: "user not logged in"}
    end
  end

  def update
    contact_id = params["id"]
    contact = Contact.find_by(id: contact_id)
    contact.first_name = params["input_name"] || contact.first_name
    contact.last_name = params["input_last_name"] ||contact.last_name
    contact.email = params["input_email"] ||contact.email
    contact.phume_number = params["input_phone_number"] ||contact.phume_number
    contact.middle_name = params["input_middle_name"] || contact.middle_name
    contact.bio = params["input_bio"] || contact.bio
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
