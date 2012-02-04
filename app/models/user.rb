class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  # By not calling any methods on the user object and attempting to write it out of the
  # view, you cause Ruby to call to_s on this method. By default, this outputs something
  # similar to the following, which isn’t human friendly:
  # #<User:0xb6fd6054>
  # You can override the to_s method on the User model to provide the string containing
  # the email and admin status of the user by the following code: 
  #
  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end

end
