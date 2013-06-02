class Project < ActiveRecord::Base
  attr_accessible :description, :title, :url

  validates :description, :title, :url, presence: true

  belongs_to :user
  validates :user_id, presence: true
end
