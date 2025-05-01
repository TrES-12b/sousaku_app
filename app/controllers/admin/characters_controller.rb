module Admin
    class CharactersController < Admin::ApplicationController
      def index
        @characters = Character.all
      end
  
      def new
        @character = Character.new
      end
  
      def create
        @character = current_user.characters.build(character_params)
        if @character.save
          redirect_to admin_characters_path, notice: "キャラクターを作成しました"
        else
          render :new
        end
      end

      def edit
        @character = Character.find(params[:id])
      end
      
      def update
        @character = Character.find(params[:id])
        if @character.update(character_params)
          redirect_to admin_characters_path, notice: "キャラクターを更新しました"
        else
          render :edit
        end
      end      
  
      private

      def character_params
        params.require(:character).permit(:name, :description, :world_id, :image_url, :color_code, :theme_song, :icon)
      end      
    end
  end  