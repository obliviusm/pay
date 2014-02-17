class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
    	t.integer :line_item_id
    	t.integer :service_id
    	t.integer	:amount
      t.timestamps
    end

    add_index :payments, [:line_item_id, :service_id], unique: true
  end
end
