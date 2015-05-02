class Project < ActiveRecord::Base
  has_many :tasks
  has_many :sprints
  has_many :teams
  has_many :announcements

  validates :title, presence: true
  attr_accessor :sprint_array


  # def tasks
  #   tasks_array = []
  #   tasks_array << sprints.map(&:tasks)
  #   tasks_array.flatten
  # end

  ## Heba
## returns the most close deadline of the sprint by tasking the projectid
  def self.recentdeadline(projectid) 
sprint_array =Sprint.where(:project_id => projectid).order(:deadline).first
sprint_array = sprint_array.deadline
end



end
