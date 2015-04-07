ActiveRecord::Schema.define(version: 0) do

  create_table "guestbooks", force: :cascade do |t|
    t.string "name",    limit: 40
    t.string "email",   limit: 40
    t.string "comment", limit: 255
    t.string "url",     limit: 255
  end

  create_table "items", force: :cascade do |t|
    t.string "name",        limit: 20
    t.string "description", limit: 40
    t.float  "cost",        limit: 24
    t.float  "price",       limit: 24
    t.string "isnew",       limit: 1
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id", limit: 4
    t.integer "item_id",  limit: 4
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.datetime "order_datetime"
    t.float    "order_cost",     limit: 24
    t.float    "order_price",    limit: 24
  end

  create_table "users", force: :cascade do |t|
    t.string "email",    limit: 40
    t.string "password", limit: 32
    t.string "fullname", limit: 50
  end

end