class Note < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  scope :sorted, lambda { order('created_at DESC') }

  def preview
    if willTruncate
    	return self.content.slice(0..100)
    else
    	return self.content
    end
  end

  def willTruncate
  	if self.content.length > 100
  		return true
  	else 
  		return false
  	end
  end
end
