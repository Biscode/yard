class Project < ActiveRecord::Base

  validates :title, presence: true
#  validates :description

end
