class CreateErpUserRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :erp_user_roles do |t|
      t.string :name, default: "default"
      t.integer :level, default: 1

      t.timestamps
    end
  end
end
