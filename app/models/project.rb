class Project < ActiveRecord::Base


  #This operation is quick and is useful if you have a large number of tickets 
  #that don’t have callbacks. 
  #If you do have callbacks on Ticket for a destroy operation, then you should 
  #use :dependent => :destroy.
  has_many :tickets, :dependent => :delete_all


  validates :name, :presence => true

  # scope pg 170/195
  has_many :permissions, :as => :thing
  scope :readable_by, lambda { |user|
    joins(:permissions).where(:permissions => { :action => "view", :user_id => user.id })
  }


  def self.for(user)
   user.admin? ? Project : Project.readable_by(user)
  end

end
