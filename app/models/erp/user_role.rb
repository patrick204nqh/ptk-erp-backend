module Erp
  class UserRole < ApplicationRecord
    # Roles defined
    ROLE_AS_SUPER_ADMIN = "SUPER_ADMIN"
    ROLE_AS_ADMIN = "ADMIN"
    ROLE_AS_PREMIUM = "PREMIUM"
    ROLE_AS_DEFAULT = "DEFAULT"
    # Levels defined
    LEVEL_OF_SUPER_ADMIN = 400
    LEVEL_OF_ADMIN = 300
    LEVEL_OF_PREMIUM = 200
    LEVEL_OF_DEFAULT = 100
  end
end
