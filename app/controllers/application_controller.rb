class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protected

  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
  	elsif resource_class == Admin
  	  Admin::ParameterSanitizer.new(Admin, :admin, params)
    else
      super # Use the default one
    end
  end

  
end

##USER STROG PARAMETERS SANITIZER
class User::ParameterSanitizer < Devise::ParameterSanitizer
  def sign_up
    default_params.permit(:email, :password, :password_confirmation,:name,:workshop_id,:phone_number)
  end

  def account_update
    default_params.permit(:password, :password_confirmation, :avatar, :current_password,:phone_number,:name,:about,:facebook,:twitter,:linkedin)
  end

  def sign_in
  end
end

##ADMIN STROG PARAMETERS SANITIZER
class Admin::ParameterSanitizer < Devise::ParameterSanitizer
  def sign_up
    default_params.permit(:name, :email, :password, :password_confirmation,:workshop_id, :phone_number)
  end

  def account_update
    default_params.permit(:name, :email, :password, :password_confirmation, :avatar,:current_password, :workshop_id,:about,:phone_number,:facebook,:twitter,:linkedin)
  end

  def sign_in
  end
end
