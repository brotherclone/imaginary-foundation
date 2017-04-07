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

ActiveRecord::Schema.define(version: 20170407155007) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "essays", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "body"
    t.text     "description"
  end

  create_table "galleries", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "gallery_images", force: true do |t|
    t.integer "gallery_id"
    t.integer "image_id"
  end

  add_index "gallery_images", ["gallery_id"], name: "index_gallery_images_on_gallery_id", using: :btree
  add_index "gallery_images", ["image_id"], name: "index_gallery_images_on_image_id", using: :btree

  create_table "goodwords", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "word"
    t.boolean  "good"
    t.string   "fromURL"
  end

  create_table "images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.integer  "essay_id"
    t.string   "image_file"
    t.integer  "promo_card_id"
    t.string   "title"
    t.text     "caption"
    t.string   "credit"
    t.string   "credit_link"
  end

  add_index "images", ["essay_id"], name: "index_images_on_essay_id", using: :btree
  add_index "images", ["project_id"], name: "index_images_on_project_id", using: :btree
  add_index "images", ["promo_card_id"], name: "index_images_on_promo_card_id", using: :btree

  create_table "projects", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "body"
    t.string   "external_url"
    t.text     "description"
  end

  create_table "promo_cards", force: true do |t|
    t.integer  "essay_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "image_id"
  end

  add_index "promo_cards", ["essay_id"], name: "index_promo_cards_on_essay_id", using: :btree
  add_index "promo_cards", ["image_id"], name: "index_promo_cards_on_image_id", using: :btree
  add_index "promo_cards", ["project_id"], name: "index_promo_cards_on_project_id", using: :btree

  create_table "pull_quotes", force: true do |t|
    t.text     "quote"
    t.integer  "essay_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pull_quotes", ["essay_id"], name: "index_pull_quotes_on_essay_id", using: :btree

end
