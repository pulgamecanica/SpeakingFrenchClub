class ApplicationController < ActionController::Base

  protected
    def authenticate_user!
      if not current_user
        redirect_to root_path
      end
    end
end
