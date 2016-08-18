class Review < ApplicationRecord
  has_attached_file :photo, styles: {thumbnail: "150x150#"}, :url  => "/assets/reviews/photos/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/reviews/photos/:id/:style/:basename.:extension"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
