class RemoveImageUrlFromPortfolioImages < ActiveRecord::Migration[7.1]
  def change
    remove_column :portfolio_images, :image_url, :string
  end
end
