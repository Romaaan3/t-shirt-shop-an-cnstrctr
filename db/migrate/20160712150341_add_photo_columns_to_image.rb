class AddPhotoColumnsToImage < ActiveRecord::Migration[5.0]
  def change
    add_attachment :images, :image
  end
end
