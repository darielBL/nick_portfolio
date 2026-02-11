class RemoveImageUrlFromPersonalWorks < ActiveRecord::Migration[7.1]
  def change
    remove_column :personal_works, :image_url, :string
  end
end
