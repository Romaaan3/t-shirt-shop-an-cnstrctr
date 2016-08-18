class Event < ApplicationRecord
  has_attached_file :photo, :styles => { :slider => "457x250#" }, :url  => "/assets/events/photos/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/events/photos/:id/:style/:basename.:extension"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
