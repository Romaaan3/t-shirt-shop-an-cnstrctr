class CreateCpConstructorImages < ActiveRecord::Migration[5.0]
  def change
    create_table :constructor_images do |t|

      t.timestamps
    end
    add_attachment :constructor_images, :img
  end
end
