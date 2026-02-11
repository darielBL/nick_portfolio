class CreateAbouts < ActiveRecord::Migration[7.1]
  def change
    create_table :abouts do |t|
      t.text :description
      t.string :image_url
      t.string :email
      t.timestamps
    end
  end
end