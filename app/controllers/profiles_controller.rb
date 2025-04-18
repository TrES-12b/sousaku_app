class ProfilesController < ApplicationController
  before_action :set_profile

  def show; end

  def edit; end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path, notice: 'プロフィールが更新されました！'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_profile
    @profile = Profile.first_or_create(name: "デフォルト名前", bio: "自己紹介を追加してください")
  end

  def profile_params
    params.require(:profile).permit(:name, :bio)
  end
end
