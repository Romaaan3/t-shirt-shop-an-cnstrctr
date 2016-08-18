class CreateCpNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string :title
      t.text :description
      t.text :anons

      t.timestamps
    end
  end
end
