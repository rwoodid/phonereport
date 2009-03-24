class FuckingChangeCostCenterTableDick < ActiveRecord::Migration
  def self.up
    drop_table :cost_centers
    create_table :cost_centres do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
  end
end
