class CreateCostCentreUploads < ActiveRecord::Migration
  def self.up
    create_table :cost_centre_uploads do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :cost_centre_uploads
  end
end
