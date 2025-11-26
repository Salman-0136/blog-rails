class RemoveCoverImageFromArticles < ActiveRecord::Migration[7.2]
  def change
    remove_column :articles, :cover_image, :string
  end
end
