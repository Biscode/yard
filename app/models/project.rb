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

  # Ahmed Saleh
  # take task status and a user an returns the number of all tasks currently in status for user
  def tasks_counter_with_user_id(status, user)
    tasks.where(status: status, user_id: user).count
  end

  # Ahmed Saleh
  # take task status and returns number of tasks currently in this status
  def tasks_counter(status)
    tasks.where(status: status).count
  end

  # Ahmed Saleh
  # return all users from project
  def users
    all_users = []
    
    teams.each do |team|
       team.users.each do |user|
         all_users << user    
       end
    end 
    return all_users
  end
end
