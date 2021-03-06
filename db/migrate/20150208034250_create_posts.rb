class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.text :message, null: false
      t.timestamps null: false
    end

    add_index :posts, :slug, unique: true
  end
end
