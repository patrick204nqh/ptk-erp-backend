module Erp
  module Backend
    class ProfileController < Erp::Backend::BackendController
      before_action :backend_authenticate
      def show
      end
    end
  end
end