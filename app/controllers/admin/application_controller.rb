module Admin
    class ApplicationController < ::ApplicationController
      before_action :require_master_user
  
      private
  
      def require_master_user
        unless current_user&.admin?
          redirect_to root_path, alert: "アクセス権限がありません。"
        end
      end
    end
  end  