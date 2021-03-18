module Erp
  class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    # Validates
    validates :username, :presence => true
    validates_format_of :email, :presence => true,
    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    :message => " is invalid (Eg. 'username@gmail.com')"

    # Relations
    belongs_to :creator, class_name: "Erp::User", optional: true
    belongs_to :role, class_name: "Erp::UserRole", optional: true # One user just has one role
    has_many :rooms, class_name: "Erp::UserRoom"
    has_many :groups, through: :rooms
    has_one :profile, class_name: "Erp::UserProfile", :foreign_key => 'user_id', :dependent => :destroy # Detroy async when destroy user

  end
end
