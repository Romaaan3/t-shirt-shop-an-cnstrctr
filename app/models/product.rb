class Product < ApplicationRecord
  has_attached_file :photo, :styles => { :slider => "240x230#" }, :url  => "/assets/products/photos/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/photos/:id/:style/:basename.:extension"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
