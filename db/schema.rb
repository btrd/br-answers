# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150505102145) do

  create_table "choixes", force: :cascade do |t|
    t.string   "valeur",      limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "question_id", limit: 4
  end

  create_table "entreprises", force: :cascade do |t|
    t.string   "nom",        limit: 255
    t.string   "mdp",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "valeur",         limit: 255
    t.boolean  "choix_multiple", limit: 1
    t.boolean  "champs_libre",   limit: 1
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "sondage_id",     limit: 4
  end

  create_table "reponses", force: :cascade do |t|
    t.string   "valeur",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    limit: 4
    t.integer  "choix_id",   limit: 4
  end

  create_table "sondages", force: :cascade do |t|
    t.string   "nom",              limit: 255
    t.date     "date_publication"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "entreprise_id",    limit: 4
  end

  create_table "sondages_users", id: false, force: :cascade do |t|
    t.integer "user_id",    limit: 4, null: false
    t.integer "sondage_id", limit: 4, null: false
  end

  add_index "sondages_users", ["sondage_id"], name: "index_sondages_users_on_sondage_id", using: :btree
  add_index "sondages_users", ["user_id"], name: "index_sondages_users_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "naissance"
    t.string   "sexe",                   limit: 255
    t.string   "etat_civil",             limit: 255
    t.integer  "pop_foyer",              limit: 4
    t.integer  "pop_enfant",             limit: 4
    t.integer  "pop_animaux",            limit: 4
    t.integer  "revenus",                limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
