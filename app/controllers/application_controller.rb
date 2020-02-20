class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?

  private


  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end




#ストロングパラメータを使用するためにconfigure_permitted_parametersを定義
  def  configure_permitted_parameters
    # binding.pry
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthday_year_id, :birthday_month_id, :birthday_day_id, :phone_num, :content])
  end

end

