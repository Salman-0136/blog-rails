class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :description, null: false
      # t.references :author, null: false, foreign_key: { to_table: :users }
      t.string :status, default: "draft"
      t.datetime :published_at
      t.string :cover_image
      t.integer :views_count, default: 0

      t.timestamps
    end
  end
end
