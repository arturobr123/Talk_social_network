class Vote < ApplicationRecord		
  belongs_to :area
  belongs_to :user

  def user_ids
  	if(self.area.votes >= 1)
  		return Vote.where(area:self.area).pluck(:user_id)
  	end
    
  end


end
