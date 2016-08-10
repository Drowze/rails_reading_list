class AddGenreToBooks < ActiveRecord::Migration[5.0]
  def change
    add_reference :books, :genre, foreign_key: true
    # add_reference (:books, :genre, {:index=>true}) # from rails 4.2

  end
end
