class WorldsController < ApplicationController
  before_action :require_master_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @worlds = World.all
  end

  def show
    @world = World.find(params[:id])
    @characters = @world.characters
  end

  def new
    @world = World.new
  end

  def create
    @world = current_user.worlds.build(world_params)
    if @world.save
      redirect_to @world, notice: "Worldが作成されました。"
    else
      render :new
    end
  end

  def edit
    @world = World.find(params[:id])
  end

  def update
    @world = World.find(params[:id])
    if @world.update(world_params)
      redirect_to @world, notice: "Worldが更新されました。"
    else
      render :edit
    end
  end

  def destroy
    @world = World.find(params[:id])
    @world.destroy
    redirect_to worlds_path, notice: "Worldを削除しました。"
  end

  private

  def world_params
    params.require(:world).permit(:name, :description)
  end

  def require_master_user
    unless current_user&.admin?
      redirect_to root_path, alert: "アクセス権限がありません。"
    end
  end
end
