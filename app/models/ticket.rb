class Ticket < ActiveRecord::Base

  # pg 306
  searcher do
    label :tag, :from => :tags, :field => :name
  end

  belongs_to :project
  belongs_to :state
  belongs_to :user
  has_many :assets
  accepts_nested_attributes_for :assets
  has_many :comments
  has_and_belongs_to_many :tags



  validates :title, :presence => true
  validates :description, :presence => true
  validates :description, :presence => true, :length => { :minimum => 10 }


  has_attached_file :asset

  attr_accessor :asset_file_name # need this or destroy always fails.

  # pg 290 11.1.6
  def tag!(tags)

    if tags 
      tags = tags.split(" ").map do |tag|
        Tag.find_or_create_by_name(tag)
      end
      self.tags << tags
    end

  end

end
