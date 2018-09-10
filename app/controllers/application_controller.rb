class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #CALLBACK
  before_action :configure_devise_params, if: :devise_controller?

  def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:name, :last_name , :email, :password, :password_confirmation )
    end
  end


end
