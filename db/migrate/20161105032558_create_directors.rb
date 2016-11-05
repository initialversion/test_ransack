class CreateDirectors < ActiveRecord::Migration
  def change
    create_table :directors do |t|
      t.string :name
      t.date :dob
      t.integer :age
      t.text :bio
      t.boolean :oscar
      t.string :image
      t.string :address

      t.timestamps

    end
  end
end
