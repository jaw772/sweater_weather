class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user == nil
      no_user_exists
    elsif user.authenticate(params[:password])
      render json:UserSerializer.format_user(user), status: 200
    else
      password_failure
    end
  end

  private

  def no_user_exists
    payload = {
      message: 'There is no user with this email',
      code: 400,
      status: 'BAD REQUEST'
    }
    render json: payload, status: :bad_request
  end

  def password_failure
    payload = {
      message: 'Your credentials do not match',
      code: 400,
      status: 'BAD REQUEST'
    }
    render json: payload, status: :bad_request
  end
end
