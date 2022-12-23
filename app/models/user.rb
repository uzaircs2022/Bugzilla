class User < ApplicationRecord

  has_many :projects, foreign_key: :creator_id, dependent: :destroy
  has_many :bugs , through: :projects

  has_many :assisgnments
  has_many :project_assigned , through: :assisgnments ,source: :project

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
