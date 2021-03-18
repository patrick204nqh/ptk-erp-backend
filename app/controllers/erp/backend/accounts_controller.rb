module Erp
  module Backend
    class AccountsController < Erp::Backend::BackendController
      before_action :set_profile, only: [:profile, :update_profile]

      def profile
      end

      def gallery
      end

      # Update profile of user but not update user table
      # ==> Because email, password,... is important infor => use another action with permission to update
      def update_profile
        if params[:user].present?
          if @profile.update(user_params)
            redirect_to erp.profile_backend_accounts_path
          else
            redirect_to erp.profile_backend_accounts_path
          end
        end
      end

      private
        def set_profile
          if current_user.present?
            @profile = current_user.profile
          end
        end

        def user_params
          params.fetch(:user, {}).permit(:first_name, :last_name, :phone , :address, :birthday, :avatar, :descriptions)
        end

    end
  end
end