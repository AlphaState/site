class AddLocaleToPost < ActiveRecord::Migration
  def change
    add_column :posts, :locale, :string
  end
end
