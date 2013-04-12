class Project < ActiveRecord::Base
  attr_accessible :description, :teaser, :title, :goal

  belongs_to :user
end