class V2::UsersController < ApplicationController

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      )
    if user.save
      render json: {message:"thank you for  using my contacts app", status: :created}
    else
      render json: {message: "something went wrong please try again", status: :bad_request}
    end
  end


end
