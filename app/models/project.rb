class Project < ActiveRecord::Base
  attr_accessible :description, :title, :url

  validates :description, :title, :url, presence: true
end
