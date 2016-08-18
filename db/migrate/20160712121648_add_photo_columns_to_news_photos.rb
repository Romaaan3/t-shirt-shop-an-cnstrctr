class AddPhotoColumnsToNewsPhotos < ActiveRecord::Migration[5.0]
  def up
    add_attachment :news_photos, :photo
  end

  def down
    remove_attachment :news_photos, :photo
  end
end
