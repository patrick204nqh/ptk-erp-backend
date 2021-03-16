class AddUserRoleToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :erp_users, :role, references: :erp_user_roles, index: true
  end
end
