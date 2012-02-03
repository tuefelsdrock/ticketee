RSpec.configure do |config|

  config.include Devise::TestHelpers, :type => :controller

  # config.include Devise::TestHelpers, :type => :controller
  # You can specify :type => :model as a filter if you want to include a
  # module only in your model specs. If you ever write any view specs, you can
  # use :type => :view to include this module only in the view specs. Simi-
  # larly, you can use :controller for controller specs.

end
