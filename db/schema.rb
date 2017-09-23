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

ActiveRecord::Schema.define(version: 20170626225537) do

  create_table "commands", force: :cascade do |t|
    t.string "usercommand"
    t.string "adress"
    t.integer "zipcode"
    t.float "price"
    t.integer "unit"
    t.date "dateEnter"
    t.time "timeEnterFrom"
    t.time "timeEnterTo"
    t.date "dateModif"
    t.time "timeModifFrom"
    t.time "timeModifTo"
    t.date "dateFinal"
    t.time "timeFinalFrom"
    t.time "timeFinalTo"
    t.text "commentaire"
    t.boolean "statewait"
    t.boolean "statedone"
    t.boolean "asap"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "username"
    t.boolean "admin"
    t.integer "price1"
    t.integer "price2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
