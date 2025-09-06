class ApplicationController < ActionController::Base
  # ログアウトした後にログイン画面へ遷移
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  # ログイン後にユーザーのプロフィールが登録されていなかった場合はプロフィール登録画面へ遷移
  def after_sign_in_path_for(resource)
    if resource.profile&.persisted?
      stored_location_for(resource) || root_path
    else
      new_profile_path
    end
  end

  # サインアップ/アカウント更新で :account_name を受け取れるようにする
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Devise Strong Parameters の拡張定義
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:account_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:account_name])
  end
end
