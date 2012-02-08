class User < ActiveRecord::Base

  # devise modules. Others available are:
  # :token_authenticatable, :encryptable, :lockable, :timeoutable and :omniauthable
  #
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # accessible (or protected) attributes 
  attr_accessible :email, :password, :password_confirmation, :remember_me

  # By not calling any methods on the user object and attempting to write it out of the
  # view, you cause Ruby to call to_s on this method. By default, this outputs something
  # similar to the following, which isn’t human friendly: <User:0xb6fd6054>
  #
  # override the to_s method on the model to provide the string containing
  # the email and admin status of the user: 
  #
  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end

  has_many :permissions


end
