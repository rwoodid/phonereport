class CreatePhonecalls < ActiveRecord::Migration
  def self.up
    create_table :phonecalls do |t|
      t.string :date
      t.string :time
      t.integer :dial_number
      t.string :destination
      t.integer :duration
      t.integer :cost
      t.string :call_type
      t.integer :cli_id
      t.integer :period_id
      t.timestamps
    end
  end

  def self.down
    drop_table :phonecalls
  end
end
