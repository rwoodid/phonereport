class ChangeIntegersToDecimalOnPhonecalls < ActiveRecord::Migration
  def self.up
    remove_column :phonecalls, :cost
    add_column :phonecalls, :cost, :decimal
    remove_column :phonecalls, :duration
    add_column :phonecalls, :duration, :decimal
  end

  def self.down
    add_column :phonecalls, :cost, :integer
    remove_column :phonecalls, :cost
    add_column :phonecalls, :duration, :integer
    remove_column :phonecalls, :duration
  end
end
