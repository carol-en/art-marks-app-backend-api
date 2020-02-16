class CreateMyBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :my_bookmarks do |t|
      t.string :site_name
      t.string :category
      t.string :url
      t.string :img
      t.string :description

      t.timestamps
    end
  end
end
