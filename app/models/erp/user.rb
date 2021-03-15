module Erp
  class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    # Validates
    validates :name, :presence => true
    validates_format_of :email, :presence => true,
    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    :message => " is invalid (Eg. 'username@gmail.com')"

    # Relations
    belongs_to :creator, class_name: "Erp::User", optional: true
    has_many :rooms, class_name: "Erp::UserRoom"
    has_many :groups, through: :rooms

    ROLE_AS_SUPER_ADMIN = "super_admin"
    ROLE_AS_ADMIN = "admin"
    ROLE_AS_DEFAULT = "default"
    ROLE_AS_PREMIUM = "premium"
  end
end
