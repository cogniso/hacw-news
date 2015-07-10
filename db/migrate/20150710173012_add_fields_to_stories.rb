class AddFieldsToStories < ActiveRecord::Migration
  def change
    add_column :news_stories, :submitter_name, :string
    add_column :news_stories, :submitter_email, :string
    add_column :news_stories, :approved, :boolean, default: false
  end
end
