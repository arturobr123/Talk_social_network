class Like < ApplicationRecord
  include Notificable
  belongs_to :post
  belongs_to :user
  def user_ids
  	self.post.NotificacionPost
    
  end

end
