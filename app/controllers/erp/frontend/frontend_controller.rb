module Erp
  module Frontend
    class FrontendController < Erp::ApplicationController
      # include Erp::ApplicationHelper # Used in controllers, views of frontend
      layout 'erp/frontend/index' # Set frontend layout
      before_action :set_view # Apply for login/logout layout

      private
        def set_view
          session[:current_view] = "frontend"
        end
    end
  end
end