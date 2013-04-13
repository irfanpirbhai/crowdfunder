class Project < ActiveRecord::Base
  attr_accessible :description, :teaser, :title, :goal, :user_id

  belongs_to :user
end