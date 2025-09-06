class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: %i[show edit update]

  def new
    if current_user.profile.present?
      return redirect_to profile_path, alert: "プロフィールは作成済みです"
    end

    @profile = current_user.build_profile
  end

  def show
    @account_name = current_user.account_name
  end

  def edit
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to profile_path, notice: "プロフィールを作成しました"
    else
      flash.now[:alert] = "入力内容を確認してください"
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:nickname, :profile_image)
  end
end
