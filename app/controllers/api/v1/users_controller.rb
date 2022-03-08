class Api::V1::UsersController < ApplicationController
  def create
    if params[:password] == params[:password_confirmation]
      user = User.create(user_params)
      if user.save
        session[:user_id] = user.id
        render json: UserSerializer.format_user(user), status: 201
      else
        invalid_email
      end
    else
      not_created
    end
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end

  def not_created
    payload = {
      message: 'Passwords do not match',
      code: 400,
      status: 'BAD REQUEST'
    }
    render json: payload, status: :bad_request
  end

  def invalid_email
    payload = {
      message: 'Email already exists',
      code: 400,
      status: 'BAD REQUEST'
    }
    render json: payload, status: :bad_request
  end
end
