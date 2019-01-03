# frozen_string_literal: true

# Helper for Sessions
module SessionsHelper

  # Logs in the user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Logs out the user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # Returns the current logged-in user (if there's any).
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
end
