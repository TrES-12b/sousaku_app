module Admin
    class WorldsController < Admin::ApplicationController
      def index
        @worlds = World.all
      end
      # 他のアクションも追加
    end
  end  