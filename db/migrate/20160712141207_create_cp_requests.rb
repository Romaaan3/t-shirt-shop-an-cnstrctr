class CreateCpRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :name
      t.string :email
      t.text :comment

      t.timestamps
    end
  end
end
