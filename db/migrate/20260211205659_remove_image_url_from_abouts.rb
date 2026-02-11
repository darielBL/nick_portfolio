class RemoveImageUrlFromAbouts < ActiveRecord::Migration[7.1]
  def change
    remove_column :abouts, :image_url, :string
  end
end
