class SessionsController < ApplicationController
  # i want to allow unauthenticated accesss to notes
  allow_unauthenticated_access only: %i[ new create  ]    

  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_path, alert: "Try again later." }



  def create
    if user = User.authenticate_by(params.permit(:email_address, :password))
      start_new_session_for user
      redirect_to after_authentication_url
    else
      redirect_to new_session_path, alert: "Try another email address or password."
    end
  end
  
  def new
  end

  def login
    user_id =10
    session[:user_id] = user_id
    render plain: "User loggedin and session stored "

  end

  def destroy
    terminate_session
    redirect_to new_session_path, status: :see_other
  end
end
