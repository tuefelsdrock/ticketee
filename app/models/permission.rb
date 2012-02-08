class Permission < ActiveRecord::Base

  belongs_to :user

  # polymorphic: pg 167/192 
  belongs_to :thing, :polymorphic => true

end
