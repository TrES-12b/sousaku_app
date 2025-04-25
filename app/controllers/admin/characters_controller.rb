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
  
      private
  
      def character_params
        params.require(:character).permit(:name, :description, :world_id)
      end
    end
  end  