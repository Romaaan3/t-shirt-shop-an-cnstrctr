class CreateCpOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :mobile
      t.string :email
      t.text :comment
      t.text :front_img
      t.text :back_img
      t.text :right_sleeve_img
      t.text :left_sleeve_img
      t.string :color
      t.string :size

      t.timestamps
    end
    add_attachment :orders, :front_image
    add_attachment :orders, :back_image
    add_attachment :orders, :right_sleeve_image
    add_attachment :orders, :left_sleeve_image
  end
end
