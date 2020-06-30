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

ActiveRecord::Schema.define(version: 2019_06_13_101654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "buyings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "barcode"
    t.boolean "use"
    t.index ["shop_id"], name: "index_buyings_on_shop_id"
    t.index ["user_id"], name: "index_buyings_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "lecture_id"
    t.index ["lecture_id"], name: "index_comments_on_lecture_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "faqs", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["position"], name: "index_faqs_on_position"
  end

  create_table "intros", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "image"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["position"], name: "index_intros_on_position"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.string "image"
    t.integer "price"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "lectures", force: :cascade do |t|
    t.string "title"
    t.string "image1"
    t.string "category"
    t.string "image2"
    t.string "image3"
    t.string "image4"
    t.integer "price"
    t.text "contents"
    t.integer "possible_time"
    t.integer "class_date"
    t.integer "total_class_num"
    t.integer "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tutor_id"
    t.integer "reviews_count", default: 0
    t.index ["tutor_id"], name: "index_lectures_on_tutor_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "lecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lecture_id"], name: "index_likes_on_lecture_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "munus", force: :cascade do |t|
    t.integer "restaurant_id"
    t.string "day"
    t.string "category"
    t.string "menu"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "amount"
    t.datetime "canceled_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_pages_on_name"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "order_id"
    t.integer "amount"
    t.string "imp_uid"
    t.string "error"
    t.string "pay_method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "body"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.integer "rid"
    t.string "rname"
    t.string "rimg"
    t.string "rtel"
    t.string "rlocation"
    t.integer "rrunningtime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.text "body"
    t.string "image"
    t.string "url"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_settings_on_name"
    t.index ["position"], name: "index_settings_on_position"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "img"
    t.string "tel"
    t.string "location"
    t.integer "runningtime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
  end

  create_table "ts", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tutors", force: :cascade do |t|
    t.string "image1"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_tutors_on_user_id"
  end

  create_table "user_items", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_user_items_on_item_id"
    t.index ["user_id"], name: "index_user_items_on_user_id"
  end

  create_table "user_lecture_jjims", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "lecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lecture_id"], name: "index_user_lecture_jjims_on_lecture_id"
    t.index ["user_id"], name: "index_user_lecture_jjims_on_user_id"
  end

  create_table "user_lecture_listens", force: :cascade do |t|
    t.integer "count"
    t.bigint "user_id"
    t.bigint "lecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lecture_id"], name: "index_user_lecture_listens_on_lecture_id"
    t.index ["user_id"], name: "index_user_lecture_listens_on_user_id"
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "username"
    t.string "image"
    t.string "phone"
    t.string "zipcode"
    t.string "address1"
    t.string "address2"
    t.datetime "deleted_at"
    t.integer "user_type", default: 0
    t.integer "account"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name"
    t.index ["phone"], name: "index_users_on_phone"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.text "object_changes"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "buyings", "shops"
  add_foreign_key "buyings", "users"
  add_foreign_key "comments", "lectures"
  add_foreign_key "comments", "users"
  add_foreign_key "items", "users"
  add_foreign_key "lectures", "tutors"
  add_foreign_key "likes", "lectures"
  add_foreign_key "likes", "users"
  add_foreign_key "messages", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "payments", "orders"
  add_foreign_key "posts", "users"
  add_foreign_key "tutors", "users"
  add_foreign_key "user_items", "items"
  add_foreign_key "user_items", "users"
  add_foreign_key "user_lecture_jjims", "lectures"
  add_foreign_key "user_lecture_jjims", "users"
  add_foreign_key "user_lecture_listens", "lectures"
  add_foreign_key "user_lecture_listens", "users"
end
