class CreateClis < ActiveRecord::Migration
  def self.up
    create_table :clis do |t|
      t.integer :phone_number
      t.integer :cost_centre_id

      t.timestamps
    end
  end

  def self.down
    drop_table :clis
    
  end
end
