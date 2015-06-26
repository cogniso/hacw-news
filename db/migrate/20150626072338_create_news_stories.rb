class CreateNewsStories < ActiveRecord::Migration
  def change
    create_table :news_stories do |t|
      t.string :title
      t.string :url
      t.string :image
      t.integer :points

      t.timestamps null: false
    end
  end
end
