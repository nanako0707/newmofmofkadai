ActiveRecord::Schema.define(version: 2020_04_29_073442) do
  create_table "properties", force: :cascade do |t|
    t.string "property_name"
    t.integer "rent"
    t.text "street_address"
    t.integer "age"
    t.text "note"
  end
end
