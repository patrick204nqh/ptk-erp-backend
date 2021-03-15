class CreateErpUserGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :erp_user_groups do |t|
      t.string :name
      t.text :description
      t.string :permission

      t.timestamps
    end
  end
end
