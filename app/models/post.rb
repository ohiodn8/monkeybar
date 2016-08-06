class Post < ActiveRecord::Base
  belongs_to :admin
  has_attached_file :image, styles: { thumb: "200x200#", medium: "250x250#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
