class Project < ActiveRecord::Base
  # has_many :tasks
  has_many :sprints
  has_many :teams

  validates :title, presence: true

  def tasks
    tasks_array = []
    tasks_array << sprints.map(&:tasks)
    tasks_array.flatten
  end
end
