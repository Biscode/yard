class Project < ActiveRecord::Base
  has_many :tasks
  has_many :sprints
  validates :title, presence: true
end
