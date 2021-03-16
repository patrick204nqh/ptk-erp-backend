# Clean database
Erp::User.destroy_all
Erp::UserRole.destroy_all
Erp::UserProfile.destroy_all

# Defined roles
ROLE_AS_SUPER_ADMIN = "SUPER_ADMIN"
ROLE_AS_ADMIN = "ADMIN"
ROLE_AS_DEFAULT = "DEFAULT"
ROLE_AS_PREMIUM = "PREMIUM"

# Create default roles of user
Erp::UserRole.create(name: ROLE_AS_DEFAULT, level: 100)
Erp::UserRole.create(name: ROLE_AS_PREMIUM, level: 200)
Erp::UserRole.create(name: ROLE_AS_ADMIN, level: 300)
Erp::UserRole.create(name: ROLE_AS_SUPER_ADMIN, level: 400)

role_super = Erp::UserRole.find_by(name: ROLE_AS_SUPER_ADMIN)

# Create default user
Erp::User.create(
  email: "patrick204nqh@gmail.com",
  password: "patrick",
  username: "patrick204nqh",
  role_id: role_super.id,
)

first_user = Erp::User.first

Erp::UserProfile.create(
  user_id: first_user.id,
  first_name: "patrick",
  last_name: "nguyen",
  phone: "0985156089",
  address: "bao loc",
  description: "dcf afdslfjl fsdfsdf dfasd",
  birthday: Time.zone.now
)

