module Erp
  module Backend
    class DashboardController < Erp::Backend::BackendController
      before_action :backend_authenticate
      def index
      end

    end
  end
end