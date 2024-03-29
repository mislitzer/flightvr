class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table "users", force: :cascade do |t|
      t.string "name"
      t.string "email"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "password_digest"
      t.index ["email"], name: "index_users_on_email", unique: true
    end
  end
end
