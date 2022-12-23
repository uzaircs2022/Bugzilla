class Project < ApplicationRecord
  belongs_to :creator, class_name: :User

  has_many :bugs, dependent: :destroy
  has_many :assisgnments , dependent: :delete_all
  has_many :assigned_user, through: :assisgnments, source: :user
end
