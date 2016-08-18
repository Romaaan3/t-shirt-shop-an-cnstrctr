class Order < ApplicationRecord
  has_attached_file :front_image, :url  => "/assets/orders/front_images/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/orders/front_images/:id/:style/:basename.:extension"
  has_attached_file :back_image, :url  => "/assets/orders/back_images/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/orders/back_images/:id/:style/:basename.:extension"
  has_attached_file :right_sleeve_image, :url  => "/assets/orders/right_sleeve_images/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/orders/right_sleeve_images/:id/:style/:basename.:extension"
  has_attached_file :left_sleeve_image, :url  => "/assets/orders/left_sleeve_images/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/orders/left_sleeve_images/:id/:style/:basename.:extension"
  validates_attachment_content_type :front_image, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :back_image, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :right_sleeve_image, content_type: /\Aimage\/.*\Z/
  validates_attachment_content_type :left_sleeve_image, content_type: /\Aimage\/.*\Z/
  has_many :images, dependent: :destroy
end
