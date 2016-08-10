class AddKeywordsToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :keywords, :text
  end
end
