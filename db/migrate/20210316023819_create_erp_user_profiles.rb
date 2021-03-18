class CreateErpUserProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :erp_user_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :address
      t.date :birthday
      t.text :descriptions
      t.string :avatar

      t.timestamps
    end
  end
end
