class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body
      t.string :tags
      t.boolean :published
      t.datetime :published_on

      t.timestamps
    end
  end
end
