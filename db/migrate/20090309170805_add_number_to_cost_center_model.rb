class AddNumberToCostCenterModel < ActiveRecord::Migration
  def self.up
    add_column :cost_centers, :number, :integer
  end

  def self.down
    add_column :cost_centers, :number
  end
end
