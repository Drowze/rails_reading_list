class RemoveGenreFromBooks < ActiveRecord::Migration[5.0]
  def up
  	remove_index :books, :genre_id
  	remove_column :books, :genre_id
  end

  def down
  	add_reference :books, :genre, foreign_key: true
  end
end
