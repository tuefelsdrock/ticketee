class Asset < ActiveRecord::Base

  has_attached_file :asset, :path => (Rails.root + "files/:id").to_s

  belongs_to :ticket

end
