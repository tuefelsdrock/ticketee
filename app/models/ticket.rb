class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :assets
  accepts_nested_attributes_for :assets
  has_many :comments


  validates :title, :presence => true
  validates :description, :presence => true
  validates :description, :presence => true, :length => { :minimum => 10 }


  has_attached_file :asset

end
