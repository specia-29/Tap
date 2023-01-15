class ApplicationController < ActionController::Base

  # deviseコントローラーにストロングパラメータを追加する
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery


  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
        new_user_session_path
    elsif resource_or_scope == :admin
        new_admin_session_path
    else
        new_user_session_path
    end
  end


  protected
  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :user_name, :birth_date, :phone_number, :profile_image])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :user_name, :birth_date, :phone_number, :profile_image])
  end
end
