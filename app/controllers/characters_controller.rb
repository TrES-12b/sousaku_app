class CharactersController < ApplicationController
  def show
    @character = Character.find(params[:id])
  end

  def new
    @world = World.find(params[:world_id])
    @character = @world.characters.build
  end

  def create
    @world = World.find(params[:world_id])
    @character = @world.characters.build(character_params)
    if @character.save
      redirect_to @character, notice: 'キャラクターが作成されました！'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @character = Character.find(params[:id])
  end

  def update
    @character = Character.find(params[:id])
    if @character.update(character_params)
      redirect_to @character, notice: 'キャラクターが更新されました！'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    redirect_to root_path, notice: 'キャラクターが削除されました。'
  end

  private

  def character_params
    params.require(:character).permit(:name, :description, :image_url, :world_id)
  end
end
