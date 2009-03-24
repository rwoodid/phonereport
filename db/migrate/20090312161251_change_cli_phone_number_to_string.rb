class ChangeCliPhoneNumberToString < ActiveRecord::Migration
  def self.up
    remove_column :clis, :phone_number
    add_column :clis, :phone_number, :string
  end

  def self.down
     add_column :clis, :phone_number, :integer
      add_column :clis, :phone_number
  end
end
