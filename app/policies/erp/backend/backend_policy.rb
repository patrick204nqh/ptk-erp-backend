module Erp
  module Backend
    class BackendPolicy < ApplicationPolicy
      def index?
      end

      def backend_access? # Access to backend if user is super admin or admin
        if user.role.present?
          user.role.name == Erp::UserRole::ROLE_AS_SUPER_ADMIN || user.role.name == Erp::UserRole::ROLE_AS_ADMIN
        else
          false
        end
      end

    end
  end
end