class Image < ApplicationRecord
  has_attached_file :image, :url  => "/assets/images/images/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/images/images/:id/:style/:basename.:extension"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  belongs_to :order
end
