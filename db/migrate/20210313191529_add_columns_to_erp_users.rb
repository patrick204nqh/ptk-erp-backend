class AddColumnsToErpUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :erp_users, :name, :string
    add_column :erp_users, :role, :string, default: "default"
    add_reference :erp_users, :creator, index: true, references: :erp_users
  end
end
