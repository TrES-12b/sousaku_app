class ProfilesController < ApplicationController
  before_action :authenticate_user!  # Deviseでログイン必須に
  before_action :set_profile

  def show; end

  def edit; end

  def update
    # ユーザー名も一緒に更新
    if @profile.update(profile_params) && current_user.update(name: params[:user_name])
      redirect_to profile_path, notice: 'プロフィールが更新されました！'
    else
      render :edit, status: :unprocessable_entity
    end
  end  

  private

  def set_profile
    @profile = current_user.profile || current_user.build_profile
  end

  def profile_params
    params.require(:profile).permit(:name, :bio)
  end
end
