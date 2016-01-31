class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string  :title
      t.integer :author_id
      t.date    :publication
      t.integer :category_id
      t.string  :hero_image_url
      t.string  :optional_image_url
      t.text    :body

      t.timestamps
    end

    add_index :articles, [:author_id]
    add_index :articles, [:category_id]
  end
end
