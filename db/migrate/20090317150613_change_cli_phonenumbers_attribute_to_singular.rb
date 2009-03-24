class ChangeCliPhonenumbersAttributeToSingular < ActiveRecord::Migration
  def self.up 
    remove_column :clis, :phone_numbers
    add_column :clis, :phone_number, :integer
  end

  def self.down
    remove_column :clis, :phone_number
    add_column :clis, :phone_numbers, :integer
  end
end
