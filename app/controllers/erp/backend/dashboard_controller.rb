module Erp
  module Backend
    class DashboardController < Erp::Backend::BackendController
      def index
        authorize [:erp, :backend, :dashboard], :index? # From 'app/policies/erp/backend/dashboard_policy.rb' (or extend from 'backend_policy.rb')
      end

    end
  end
end