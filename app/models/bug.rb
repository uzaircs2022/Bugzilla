class Bug < ApplicationRecord
  belongs_to :project
  belongs_to :reported_by, class_name: :User
  belongs_to :assigned_to, class_name: :User, optional: true
  has_one_attached :image

  validates :title, :status, :bugtype, presence: true
  validates :title, uniqueness: true
  validate :correct_image_type


  def correct_image_type
    if image.attached? && !image.content_type.in?(%w(image/png image/gif))
      errors.add(:image, 'Must be a PNG or GIF')
    end
  end
end
