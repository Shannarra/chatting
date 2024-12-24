class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :handle_unauthorized!
  rescue_from ActiveRecord::RecordNotFound, with: :handle_nonexistent_record!

  private
    def handle_unauthorized!
      flash[:alert] = "You are not authorized to perform this action!"
      redirect_back_or_to root_path
    end

    def handle_nonexistent_record!
      flash[:alert] = "The record you are looking for does not exist."
      redirect_back_or_to root_path
    end
end
