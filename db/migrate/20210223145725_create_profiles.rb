class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :address_line
      t.string :street
      t.string :landmark
      t.string :city
      t.string :state
      t.string :pincode
      t.string :country
      t.references :user

      t.timestamps
    end
  end
end
