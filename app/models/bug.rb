# app/models/bug.rb
class Bug < ApplicationRecord
  # Associations
  belongs_to :project
  belongs_to :reported_by, class_name: "User"
  belongs_to :assigned_to, class_name: "User", optional: true

  has_one_attached :image

  # Constants
  ALLOWED_IMAGE_TYPES = %w[image/png image/gif].freeze

  # Enums (if applicable)
  enum status: { open: 0, in_progress: 1, resolved: 2, closed: 3 }, _suffix: true
  enum bugtype: { feature: 0, bug: 1 }, _suffix: true

  # Validations
  validates :title, presence: true, uniqueness: true
  validates :status, :bugtype, presence: true
  validate :acceptable_image

  private

  def acceptable_image
    return unless image.attached?

    unless image.content_type.in?(ALLOWED_IMAGE_TYPES)
      errors.add(:image, "must be a PNG or GIF")
    end
  end
end
