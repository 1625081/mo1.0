class ApplicationController < ActionController::Base
  require 'digest'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :null_session
  before_action :check_drivers
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :rescue_errors, only: :api_info
  helper_method :init_token

  def api_info(params)
    if params["timestamp"]
      # 30s 超时
      if Time.now.to_i - params["timestamp"].to_i <= 30
        token = params["token"]
        p = params.delete("token")
        # 检查Token, 7位盐
        if Digest::MD5.hexdigest(p.to_s) == token[0..-7]
          return p
        else
          raise NoPoliceError
        end
      else
        raise TimeOutError
      end
    else
      raise UnknowError
    end
  end

  def rescue_errors
    begin
      yield
    rescue 
      case Exception
      when NoPoliceError
        flash[:warning] = '你没有权利完成该请求！'
        logger.error '========ERROR: Wrong Token!========'
      when TimeOutError
        flash[:warning] = '请求超时，请重试！'
        logger.error '========ERROR: Time Out!========'
      when UnknowError
        flash[:warning] = '未知错误，请重试！'
        logger.error '========ERROR: Wrong Params!========'
      end
    end
  end

  def init_token(params)
    # 加七位盐
    raw_string = params.to_s
    return Digest::MD5.hexdigest(raw_string) + Rails.application.secrets.secret_key_base[2...9]
  end

  protected

  def check_drivers
    request.variant = :tablet if request.user_agent =~ /iPad/
    request.variant = :phone if request.user_agent =~ /iPhone/
    request.variant = :phone if request.user_agent =~ /Android/
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end

  def after_sign_in_path_for(resource)
    home_path
  end
end
