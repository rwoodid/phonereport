# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090307230930) do

  create_table "bills", :force => true do |t|
    t.string   "name"
    t.integer  "report_id",             :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "csv_file_file_name"
    t.string   "csv_file_content_type"
    t.integer  "csv_file_file_size",    :limit => 11
    t.datetime "csv_file_updated_at"
  end

  create_table "clis", :force => true do |t|
    t.integer  "phone_number",   :limit => 11
    t.integer  "cost_centre_id", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cost_centers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "periods", :force => true do |t|
    t.string   "month"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phonecalls", :force => true do |t|
    t.string   "date"
    t.string   "time"
    t.integer  "dial_number", :limit => 11
    t.string   "destination"
    t.integer  "duration",    :limit => 11
    t.integer  "cost",        :limit => 11
    t.string   "call_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "period_id",   :limit => 11
    t.integer  "cli_id",      :limit => 11
  end

  create_table "reports", :force => true do |t|
    t.string   "name"
    t.integer  "period_id",  :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
