class AddAltAndHintToNewsPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :news_photos, :alt, :string, default: ""
    add_column :news_photos, :hint, :string, default: ""
  end
end
