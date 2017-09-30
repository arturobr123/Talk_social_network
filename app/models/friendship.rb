class Friendship < ApplicationRecord
  include AASM
  include Notificable

  belongs_to :user
  belongs_to :friend, class_name:"User"
  validates :user_id,uniqueness:{ scope: :friend_id, message: "AMISTAD DUPLICADA"}

  def self.friends?(user,friend)
    return true if user == friend
    Friendship.where(user:user, friend: friend).or(Friendship.where(user:friend,friend:user)).any?
    #regresa true si encontro alguna relacion entre ambos (son amigos) , si no
    # si se pueden agregar ya que no son amigos (false)
  end

  def self.pending_for_user(user)
    Friendship.pending.where(friend: user)
    
  end

  def self.accepted_for_user(user)
    Friendship.active.where(friend: user)
    
  end

  def user_ids
    self.user.friend_ids + self.user.user_ids
  end

  aasm column: "status" do

  	state :pending, initial: true
  	state :active
  	state :denied

  	event :accepted do
  		transitions from: [:pending], to: [:active]
  	end


  	event :rejected do
  		transitions from: [:pending,:active], to: [:denied]
  	end

  	
  end

end
