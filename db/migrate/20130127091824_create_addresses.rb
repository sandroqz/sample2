class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.belongs_to :user
      t.string :street
      t.string :complement
      t.string :city
      t.string :state
      t.string :country
      t.integer :zip_code
      t.integer :number

      t.timestamps
    end
    add_index :addresses, :user_id
  end
end
