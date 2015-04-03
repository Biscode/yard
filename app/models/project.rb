class Project < ActiveRecord::Base
  has_many :tasks
  has_many :sprints
  validates :title, presence: true

  # def deadlines
  #   self.tasks.group('deadline').count.keys
  # end
end
