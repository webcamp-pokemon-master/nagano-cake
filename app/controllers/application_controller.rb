class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception


  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :postal_code,
      :address,
      :phone_number])
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_orders_path
    when Customer
      root_path
    end
  end


  def after_sign_out_path_for(resource)
    new_customer_session_path # ログアウト後に遷移するpathを設定
  end

end
