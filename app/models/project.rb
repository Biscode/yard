class Project < ActiveRecord::Base
  has_many :tasks
  has_many :sprints
  has_many :teams

  validates :title, presence: true

  # def tasks
  #   tasks_array = []
  #   tasks_array << sprints.map(&:tasks)
  #   tasks_array.flatten
  # end

  def tasks_counter_with_user_id(status, user)
    tasks.where(status: status, user_id: user).count
  end

  def tasks_counter(status)
      tasks.where(status: status).count
  end
end
