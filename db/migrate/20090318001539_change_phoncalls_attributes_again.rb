class ChangePhoncallsAttributesAgain < ActiveRecord::Migration
  def self.up
    remove_column :phonecalls, :date
    add_column :phonecalls, :date_of_call, :string
  end

  def self.down
    remove_column :phonecalls, :date
    add_column :phonecalls, :date, :float
  end
end
