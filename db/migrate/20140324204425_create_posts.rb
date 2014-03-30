class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title,       null: false, default: ''
      t.string :author,      null: false, default: ''
      t.text   :description, null: false, default: ''
      t.text   :content,     null: false, default: ''
      t.date   :date,        null: false
      t.string :locale,      null: false, default: ''
      t.string :address,     null: false, default: ''
    end
  end
end
