class CreateErpUserRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :erp_user_rooms do |t|
      t.references :user, index: true, references: :erp_users
      t.references :group, index: true, references: :erp_user_groups

      t.timestamps
    end
  end
end
