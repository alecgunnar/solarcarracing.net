class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end

    def require_session
      return if user_signed_in?
      redirect_to new_user_session_path, notice: 'You must sign in to continue!'
    end
end
