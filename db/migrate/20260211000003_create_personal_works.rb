class CreatePersonalWorks < ActiveRecord::Migration[7.1]
  def change
    create_table :personal_works do |t|
      t.string :title, default: 'nick nightin'
      t.string :image_url, null: false
      t.string :email, null: false
      t.integer :position, default: 0
      t.timestamps
    end
  end
end