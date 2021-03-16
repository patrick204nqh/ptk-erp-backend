module Erp
  class UserRoom < ApplicationRecord
    belongs_to :user, class_name: "Erp::User", foreign_key: "user_id"
    belongs_to :group, class_name: "Erp::UserGroup", foreign_key: "group_id"
  end
end
