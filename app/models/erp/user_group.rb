module Erp
  class UserGroup < ApplicationRecord
    has_many :rooms, class_name: "Erp::UserRoom", foreign_key: "group_id"
    has_many :users, through: :rooms, foreign_key: "user_id"
  end
end
