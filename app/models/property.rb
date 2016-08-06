class Property < ActiveRecord::Base
  belongs_to :location
  belongs_to :bedroom
  has_attached_file :image, styles: { medium: "300x350#", thumb: "150x250"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
