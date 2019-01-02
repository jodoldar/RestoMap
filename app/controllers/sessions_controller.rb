# frozen_string_literal: true

# Sessions controller
class SessionsController < ApplicationController
  def new
    # Now empty
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      # Log the user in and redirect to user
    else
      # Create an error message
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    # Now empty
  end
end
