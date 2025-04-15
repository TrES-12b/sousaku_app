class CharactersController < ApplicationController
  def index
    if params[:world_id]
      @world = World.find(params[:world_id])
      @characters = @world.characters
    else
      @characters = Character.all
    end
  end

  def show
    @character = Character.find(params[:id])  # ← showにもキャラ取得が必要！
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
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
    redirect_to characters_path, notice: 'キャラクターが削除されました。'
  end

  private

  def character_params
    params.require(:character).permit(:name, :description, :world_id, :image_url)
  end
end
