
module SeedHelpers

  # this eliminates the need to dup this code in multpile controller spec files
  def create_user!(attributes={})
    user = Factory(:user, attributes)
    user.confirm!
    user
  end
end

RSpec.configure do |config|
  config.include SeedHelpers
end

