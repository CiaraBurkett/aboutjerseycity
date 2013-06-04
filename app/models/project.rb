class Project < ActiveRecord::Base
  attr_accessible :description, :title, :url, :image

  validates :description, :title, :url, presence: true
  validates :user_id, presence: true
  validates_attachment :image, presence: :true, 
  						content_type: {content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']},
  						size: {less_than: 5.megabytes}

  belongs_to :user
  has_attached_file :image, styles: {medium: "400x300>"}
end
