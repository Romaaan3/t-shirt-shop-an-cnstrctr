class CreateCpImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
