class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :duration
      t.float :rating
      t.text :description
      t.integer :director_id

      t.timestamps

    end
  end
end
