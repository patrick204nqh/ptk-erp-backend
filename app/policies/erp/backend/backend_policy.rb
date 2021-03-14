module Erp
  module Backend
    class BackendPolicy < ApplicationPolicy
      def index?
        user.role == Erp::User::ROLE_AS_SUPER_ADMIN || user.role == Erp::User::ROLE_AS_ADMIN
      end

    end
  end
end