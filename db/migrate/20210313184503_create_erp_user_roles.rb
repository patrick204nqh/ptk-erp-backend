class CreateErpUserRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :erp_user_roles do |t|
      t.string :name, default: "DEFAULT"
      t.integer :level, default: 100

      t.timestamps
    end
  end
end
