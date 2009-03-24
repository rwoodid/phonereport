class ChangeCliPhonenumberInteger < ActiveRecord::Migration
  def self.up
      remove_column :clis, :phone_number
      add_column :clis, :phone_numbers, :integer
      
    end

    def self.down
      remove_column :clis, :phone_number
      add_column :clis, :phone_numbers, :string
    end
  end
  
