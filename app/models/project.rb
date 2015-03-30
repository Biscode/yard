class Project < ActiveRecord::Base
  has_many :tasks
  has_many :teams
  validates :title, presence: true
end
