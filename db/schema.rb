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

ActiveRecord::Schema.define(version: 20160810214121) do

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

  create_table "article_files", force: true do |t|
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "articles", force: true do |t|
    t.string   "title"
    t.integer  "author_id"
    t.string   "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "journal_id"
    t.string   "coauthors"
    t.string   "publication_data"
  end

  create_table "articles_chapters", force: true do |t|
    t.integer "article_id"
    t.integer "chapter_id"
  end

  create_table "articles_reviews", force: true do |t|
    t.integer "article_id"
    t.integer "review_id"
  end

  create_table "articles_sections", force: true do |t|
    t.integer "article_id"
    t.integer "section_id"
  end

  create_table "articles_subsections", force: true do |t|
    t.integer "article_id"
    t.integer "subsection_id"
  end

  create_table "authors", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "patronymic"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookmark_groups", force: true do |t|
    t.string   "title"
    t.integer  "bookmark_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookmarks", force: true do |t|
    t.string   "title"
    t.text     "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bookmark_group_id"
  end

  create_table "chapters", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "journals", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "old_articles", force: true do |t|
    t.integer  "author_idi"
    t.integer  "article_idi"
    t.integer  "article_id_old"
    t.string   "coauthors"
    t.string   "journal"
    t.string   "nazvanie"
    t.string   "year"
    t.string   "shapka1"
    t.string   "shapka2"
    t.string   "month_tp"
    t.string   "que"
    t.boolean  "vpechati"
    t.string   "status"
    t.string   "type_art"
    t.string   "http_address"
    t.string   "person"
    t.string   "word_abs"
    t.string   "word_abstr"
    t.string   "pdf_abstr"
    t.string   "word"
    t.string   "word2"
    t.string   "pdf"
    t.string   "browser_file"
    t.string   "packet"
    t.string   "transl"
    t.date     "checked_up"
    t.text     "resume"
    t.boolean  "ref"
    t.boolean  "xerox"
    t.text     "mistake"
    t.string   "email"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "old_authors", force: true do |t|
    t.integer  "author_idi"
    t.integer  "old_author_idi"
    t.string   "author_name"
    t.string   "short_i"
    t.string   "short_o"
    t.string   "imya"
    t.string   "otch"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "old_level4s", force: true do |t|
    t.integer  "punkt_idi"
    t.integer  "level_4_idi"
    t.string   "level_4"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "old_obzors", force: true do |t|
    t.integer  "n_from_razdel"
    t.integer  "n_obzor"
    t.string   "obzor_podst"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "old_position1s", force: true do |t|
    t.integer  "article_idi"
    t.integer  "position1_idi"
    t.string   "position1"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "old_position2s", force: true do |t|
    t.integer  "position1_idi"
    t.integer  "position2_idi"
    t.string   "position2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "old_position3s", force: true do |t|
    t.integer  "position2_idi"
    t.integer  "position3_idi"
    t.string   "position3"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "old_position4s", force: true do |t|
    t.integer  "position3_idi"
    t.integer  "position4_idi"
    t.string   "position4"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "old_punkts", force: true do |t|
    t.integer  "n_from_obzor"
    t.integer  "n_punct"
    t.string   "punct_podst"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "old_razdels", force: true do |t|
    t.integer  "n_razdel"
    t.string   "razdel_podst"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.string   "title"
    t.integer  "chapter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.string   "title",      default: "title is missing"
    t.integer  "review_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subsections", force: true do |t|
    t.string   "title",      default: "title is missing"
    t.integer  "section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "login",                  default: "", null: false
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

  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
