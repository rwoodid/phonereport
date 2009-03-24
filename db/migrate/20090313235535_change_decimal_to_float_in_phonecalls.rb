class ChangeDecimalToFloatInPhonecalls < ActiveRecord::Migration
   def self.up
      remove_column :phonecalls, :cost
      add_column :phonecalls, :cost, :float
      remove_column :phonecalls, :duration
      add_column :phonecalls, :duration, :float
    end

    def self.down
      add_column :phonecalls, :cost, :decimal
      remove_column :phonecalls, :cost
      add_column :phonecalls, :duration, :decimal
      remove_column :phonecalls, :duration
    end
  end
  