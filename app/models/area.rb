class Area < ApplicationRecord
  belongs_to :user
  scope :nuevos, ->{order("created_at desc")}
  has_many :votes

  def already_votes?(user) 
    self.votes.where(user:user).any?
  end


  def self.GoalTrue
    Area.where(goal: true)
  end


end
