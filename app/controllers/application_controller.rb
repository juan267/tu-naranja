class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  protected

    def after_sign_in_path_for(resource)
      if current_user.role?(:admin)
        farms_path
      else
        farm_path(resource.farm)
      end
    end

    def after_update_path_for(resource)
      signed_in_root_path(resource)
    end
end
