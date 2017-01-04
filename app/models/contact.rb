class Contact < ApplicationRecord

  # validate presence of name (other fields may be kept blank)
  validates :f_name, presence: true
  validates :l_name, presence: true

  # for contact image
  has_attached_file :image, styles: { medium: "300x300>", small: "100x100>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
