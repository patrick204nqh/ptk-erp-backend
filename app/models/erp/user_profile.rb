module Erp
  class UserProfile < ApplicationRecord
    # Relations
    belongs_to :user, class_name: "Erp::User"
    # Mount upload
    mount_uploader :avatar, Erp::AvatarUploader
  end
end
