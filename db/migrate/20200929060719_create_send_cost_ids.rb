class CreateSendCostIds < ActiveRecord::Migration[6.0]
  def change
    create_table :send_cost_ids do |t|

      t.timestamps
    end
  end
end
