# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_27_011839) do

  create_table "active_admin_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "activities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "trackable_type"
    t.bigint "trackable_id"
    t.string "owner_type"
    t.bigint "owner_id"
    t.string "key"
    t.text "parameters"
    t.string "recipient_type"
    t.bigint "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
    t.index ["owner_type", "owner_id"], name: "index_activities_on_owner_type_and_owner_id"
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
    t.index ["recipient_type", "recipient_id"], name: "index_activities_on_recipient_type_and_recipient_id"
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"
    t.index ["trackable_type", "trackable_id"], name: "index_activities_on_trackable_type_and_trackable_id"
  end

  create_table "analyses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.text "description"
    t.text "conclusions"
    t.bigint "user_id", null: false
    t.bigint "observation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "classification_id"
    t.bigint "interpretation_id"
    t.integer "permit_level"
    t.index ["classification_id"], name: "index_analyses_on_classification_id"
    t.index ["interpretation_id"], name: "index_analyses_on_interpretation_id"
    t.index ["observation_id"], name: "index_analyses_on_observation_id"
    t.index ["user_id"], name: "index_analyses_on_user_id"
  end

  create_table "classifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "{:null=>true, :foreign_key=>true}_id"
    t.bigint "{:null=>true, :foreign_key=>true, :index=>true}_id"
    t.index ["{:null=>true, :foreign_key=>true}_id"], name: "index_classifications_on_{:null=>true, :foreign_key=>true}_id"
  end

  create_table "interpretations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "{:null=>true, :foreign_key=>true}_id"
    t.index ["{:null=>true, :foreign_key=>true}_id"], name: "index_interpretations_on_{:null=>true, :foreign_key=>true}_id"
  end

  create_table "observations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "gps"
    t.text "description"
    t.string "directory_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.timestamp "occurred_at"
    t.integer "permit_level"
  end

  create_table "observations_observers", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "observation_id", null: false
    t.bigint "observer_id", null: false
  end

  create_table "observers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "nick"
    t.string "address"
    t.string "contact"
    t.string "photo"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role"
    t.string "password_salt"
    t.integer "permit_level"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "analyses", "classifications"
  add_foreign_key "analyses", "interpretations"
  add_foreign_key "analyses", "observations"
  add_foreign_key "analyses", "users"
end
