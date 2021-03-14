# Clean database
Erp::User.destroy_all
Erp::UserRole.destroy_all

# Create default user
Erp::User.create(
  email: "patrick204nqh@gmail.com",
  password: "patrick204nqh",
  name: "Karl Patrick",
  role: Erp::User::ROLE_AS_SUPER_ADMIN,
)

# Defined roles
ROLE_AS_SUPER_ADMIN = "super_admin"
ROLE_AS_ADMIN = "admin"
ROLE_AS_DEFAULT = "default"
ROLE_AS_PREMIUM = "premium"

# Create default roles of user
Erp::UserRole.create(name: ROLE_AS_DEFAULT, level: 100)
Erp::UserRole.create(name: ROLE_AS_PREMIUM, level: 200)
Erp::UserRole.create(name: ROLE_AS_ADMIN, level: 300)
Erp::UserRole.create(name: ROLE_AS_SUPER_ADMIN, level: 400)