class AddNestingToComments < ActiveRecord::Migration
  def change
     add_column :news_comments, :parent_id, :integer
     add_column :news_comments, :lft,       :integer
     add_column :news_comments, :rgt,       :integer
     add_index :news_comments, :rgt
     add_index :news_comments, :parent_id
  end
end
