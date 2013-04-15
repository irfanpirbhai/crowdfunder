class Project < ActiveRecord::Base
  attr_accessible :description, :teaser, :title, :goal, :user_id

  belongs_to :user
  has_many :pledges

  validates_presence_of :description, :teaser, :title, :user_id
  validates :goal, :presence => true, :numericality => { :greater_than => 0 }

  def current_goal
    sum = 0
    self.pledges.each do |pledge|
      sum += pledge[:amount]
    end  
    return sum
  end

end