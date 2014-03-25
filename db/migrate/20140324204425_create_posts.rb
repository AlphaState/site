class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :author
      t.text :description
      t.text :content
      t.date :date
    end
  end
end
