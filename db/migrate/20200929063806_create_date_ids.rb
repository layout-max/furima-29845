class CreateDateIds < ActiveRecord::Migration[6.0]
  def change
    create_table :date_ids do |t|

      t.timestamps
    end
  end
end
