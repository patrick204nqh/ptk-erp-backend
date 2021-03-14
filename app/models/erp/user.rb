module Erp
  class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    ROLE_AS_SUPER_ADMIN = "super_admin"
    ROLE_AS_ADMIN = "admin"
    ROLE_AS_DEFAULT = "default"
    ROLE_AS_PREMIUM = "premium"
  end
end
