class State < ActiveRecord::Base

  # avoid just an inspect on to_s, instead provide a string 
  def to_s
    name
  end

end
