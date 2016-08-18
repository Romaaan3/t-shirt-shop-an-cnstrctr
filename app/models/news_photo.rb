class NewsPhoto < ApplicationRecord
  has_attached_file :photo, :url  => "/assets/news/photos/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/news/photos/:id/:style/:basename.:extension"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
