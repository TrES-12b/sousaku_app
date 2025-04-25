class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # サインアップ時に name を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    # アカウント編集時にも name を許可（任意だけどあると便利）
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
