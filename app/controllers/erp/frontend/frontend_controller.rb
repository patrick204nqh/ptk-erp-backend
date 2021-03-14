module Erp
  module Frontend
    class FrontendController < Erp::ApplicationController
      layout 'erp/frontend/index'
      before_action :set_view # Apply for login/logout layout

      private
        def set_view
          session[:current_view] = "frontend"
        end
    end
  end
end