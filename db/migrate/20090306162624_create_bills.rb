class CreateBills < ActiveRecord::Migration
  def self.up
    create_table :bills do |t|
      t.string :name
      t.integer :report_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bills
  end
end
