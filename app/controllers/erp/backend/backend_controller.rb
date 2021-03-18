module Erp
  module Backend
    class BackendController < Erp::ApplicationController
      layout "erp/backend/index" # When 'url: https://.../backend/...' => accesst to backend
      include Erp::BackendHelper
      before_action :set_view # Apply for login/logout layout
      before_action :authenticate_user!, :backend_authenticate? # Authenticate backend controllers

      rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

      # TODO: remove this statement
      # if Erp::Backend.available?("frontend")
      #   logger.info "=================================="
      #   logger.info "available"
      # end ==> true

      private
        def set_view
          session[:current_view] = "backend"
        end

        def user_not_authorized
          redirect_to erp.new_user_session_path
        end

        def backend_authenticate?
          authorize [:erp, :backend, :backend], :backend_access? # From 'app/policies/erp/backend/backend_policy.rb' (parent of 'dashboard_policy.rb')
        end

    end
  end
end
