class CreateAreaIds < ActiveRecord::Migration[6.0]
  def change
    create_table :area_ids do |t|

      t.timestamps
    end
  end
end
