class AddUserToErpUserProfiles < ActiveRecord::Migration[6.1]
  def change
    add_reference :erp_user_profiles, :user, references: :erp_users, index: { unique: true } # one user just has one profile
  end
end
