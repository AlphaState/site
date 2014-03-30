class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title,     null: false, default: ''
      t.string :motto,     null: false, default: ''
      t.string :thumbnail, null: false, default: ''
      t.string :address,   null: false, default: ''
      t.string :locale,    null: false, default: ''
      t.float  :priority,  null: false, default: 0
      t.text   :content,   null: false, default: ''
    end
  end
end
