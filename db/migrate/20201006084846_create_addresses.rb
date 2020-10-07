class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postcode
      t.integer :area_id
      t.string :cities
      t.string :number
      t.string :building
      t.string :telephone
      t.timestamps
    end
  end
end
