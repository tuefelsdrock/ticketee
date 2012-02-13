class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :state

  validates :text, :presence => true

end
