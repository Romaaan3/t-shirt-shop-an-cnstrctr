class CreateCpEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :anons
      t.text :description

      t.timestamps
    end
    add_attachment :events, :photo
  end
end
