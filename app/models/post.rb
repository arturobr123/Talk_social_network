# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  area       :decimal(, )
#  usuario    :string
#

#Scaffold crea un CRUD  => Create, Read, Update, Delete
class Post < ApplicationRecord

  belongs_to :user
  scope :nuevos, ->{order("created_at desc")}
  #after_create :send_to_action_cable
  has_many :comments
  has_many :likes
  has_many :dislikes
  has_many :shares


  has_attached_file :photo
  validates_attachment_content_type :photo,
    :content_type => ['video/mp4'],
    :message => "Sorry, right now we only support MP4 video",
    :if => :is_type_of_video?
  validates_attachment_content_type :photo,
     :content_type => ['image/png', 'image/jpeg', 'image/jpg', 'image/gif'],
     :message => "Different error message",
     :if => :is_type_of_image?
  
 #has_attached_file :photo,styles: {thumb:"100x100",medium:"300x300",popup:"500x500"}
 #validates_attachment_content_type :photo,content_type: /\Aimage\/.*\Z/

  #validates_attachment_content_type :photo,:content_type => ['video/mp4'],:message => "Sorry, right now we only support MP4 video"
  def already_shares?(user) 
    self.shares.where(user:user).any?
  end

  def already_likes?(user) 
    self.likes.where(user:user).any?
  end

  def already_dislikes?(user) 
    self.dislikes.where(user:user).any?
  end

  def already_shares?(user) 
    self.shares.where(user:user).any?
  end

  def self.all_for_user(user)
  Post.where(user_id: user.id)
    .or(Post.where(user_id: user.friend_ids))
    .or(Post.where(user_id: user.user_ids))

  end

  
  def self.all_for_area(var)
  Post.where(area: var)

  end

  def user_ids
    self.user.friend_ids + self.user.user_ids
    
  end

  def NotificacionPost
      return Post.find(self).user_id
 
  end


  private
    def send_to_action_cable
      
      data = {message:to_html, action:"new_post"}

      #yo agrege
      self.user.friend_ids.each do |friend_id|
        printf "AMIGOSSSSSSSSSSSS"
        ActionCable.server.broadcast "posts_#{friend_id}", data
      end

      # a mi me agregaron
      self.user.user_ids.each do |friend_id|
        ActionCable.server.broadcast "posts_#{friend_id}", data
      end
      
    end

    def to_html
      printf "ENTRO"
      ApplicationController.renderer.render(partial:"posts/post",locals: {post:self.decorate})
    
    end




  protected
  def is_type_of_video?
    photo.content_type =~ %r(video)
  end

  def is_type_of_image?
    photo.content_type =~ %r(image)
  end




end
