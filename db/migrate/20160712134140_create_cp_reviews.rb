class CreateCpReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :cause
      t.text :comment
      t.boolean :isValid

      t.timestamps
    end
    add_attachment :reviews, :photo
  end
end
