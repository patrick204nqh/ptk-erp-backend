class AddColumnsToErpUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :erp_users, :username, :string
    add_column :erp_users, :status, :string, default: "ACTIVE"
    add_reference :erp_users, :creator, index: true, references: :erp_users
  end
end
