class CreateAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :postal_code
      t.bigint :user_id
      t.bigint :province_id

      t.timestamps
    end
    add_index :addresses, :user_id
    add_index :addresses, :province_id
  end
end