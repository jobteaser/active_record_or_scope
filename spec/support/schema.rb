ActiveRecord::Schema.define(version: 20161230161832) do
  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "status"
  end
end
