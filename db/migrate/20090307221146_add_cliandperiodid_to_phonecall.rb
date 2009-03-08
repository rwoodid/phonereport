class AddCliandperiodidToPhonecall < ActiveRecord::Migration
  def self.up
    add_column :phonecalls, :period_id, :integer
    add_column :phonecalls, :cli_id, :integer
  end

  def self.down
    remove_column :phonecalls, :period_id
    remove_column :phonecalls, :cli_id
  end
end
