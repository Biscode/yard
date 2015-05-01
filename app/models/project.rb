class Project < ActiveRecord::Base
  has_many :tasks
  has_many :sprints
  has_many :teams
  has_many :announcements

  validates :title, presence: true

  # def tasks
  #   tasks_array = []
  #   tasks_array << sprints.map(&:tasks)
  #   tasks_array.flatten
  # end
  def self.recentdeadline(projectid) 
Sprint_array =Sprint.where(:project_id => projectid).order(:deadline).first
end
end
