
ActiveRecord::Schema[7.0].define(version: 2022_12_23_095628) do

  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trends", force: :cascade do |t|
    t.string "session_id"
    t.string "search"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
