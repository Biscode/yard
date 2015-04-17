class Project < ActiveRecord::Base
  has_many :tasks
  has_many :sprints
  has_many :teams
  has_many :announcements

  validates :title, presence: true
end
