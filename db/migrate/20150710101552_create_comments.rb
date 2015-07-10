class CreateComments < ActiveRecord::Migration
  def change
    create_table :news_comments do |t|
      t.belongs_to :story
      t.text :body
      t.integer :points, default: 0

      t.timestamps null: false
    end
  end
end
