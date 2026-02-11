class CreateSocialLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :social_links do |t|
      t.string :platform, null: false
      t.string :url, null: false
      t.string :icon, null: false
      t.string :label, null: false
      t.integer :position, default: 0
      t.timestamps
    end
    add_index :social_links, :platform, unique: true
  end
end