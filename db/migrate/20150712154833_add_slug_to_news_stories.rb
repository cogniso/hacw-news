class AddSlugToNewsStories < ActiveRecord::Migration
  def change
    add_column :news_stories, :slug, :string
    add_index :news_stories, :slug, unique: true
  end
end
