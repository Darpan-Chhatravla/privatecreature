# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170912161020) do

  create_table "ifsc_codes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "bank"
    t.string "ifsc_number", limit: 100
    t.string "micr", limit: 100
    t.string "branch"
    t.text "address"
    t.string "contact", limit: 20
    t.string "city", limit: 100
    t.string "district", limit: 100
    t.string "state", limit: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank"], name: "index_ifsc_codes_on_bank"
    t.index ["branch"], name: "index_ifsc_codes_on_branch"
    t.index ["ifsc_number"], name: "index_ifsc_codes_on_ifsc_number"
  end

end
