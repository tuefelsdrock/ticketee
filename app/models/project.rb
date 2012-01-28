class Project < ActiveRecord::Base


  #This operation is quick and is useful if you have a large number of tickets 
  #that don’t have callbacks. 
  #If you do have callbacks on Ticket for a destroy operation, then you should 
  #use :dependent => :destroy.
  has_many :tickets, :dependent => :delete_all


  validates :name, :presence => true
end
