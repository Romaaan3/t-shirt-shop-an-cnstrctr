class ConstructorImage < ApplicationRecord
  has_attached_file :img, :url  => "/assets/constructor_images/imgs/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/constructor_images/imgs/:id/:style/:basename.:extension"
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\Z/
end
