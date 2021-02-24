class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
