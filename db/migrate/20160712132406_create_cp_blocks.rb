class CreateCpBlocks < ActiveRecord::Migration[5.0]
  def change
    create_table :blocks do |t|
      t.string :name
      t.text :text
      t.string :title
      t.text :description
      t.string :keywords

      t.timestamps
    end
  end
end
