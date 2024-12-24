class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create register sign_up ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
  end

  def register
  end

  def sign_up
    @user = User.new(user_registration_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "You have registered successfully! Please, sign in to use the platform." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :register, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    if user = User.authenticate_by(params.permit(:email_address, :password))
      start_new_session_for user
      redirect_to after_authentication_url
    else
      redirect_to new_session_path, alert: "Try another email address or password."
    end
  end

  def destroy
    terminate_session
    redirect_to new_session_path
  end

  private
    def user_registration_params
      params.permit(:name, :email_address, :password)
    end
end
