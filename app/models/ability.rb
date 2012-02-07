class Ability
  include CanCan::Ability

  # The Ability class’s initialize method defines how can? and cannot? will act. 
  # Here you iterate over all the users’ permissions and use the can? method to
  # say that a user can perform a specific function. Users who shouldn’t be able to per-
  # form that function won’t have an entry in the permissions table for it. 
  # 
  def initialize(user)
    user.permissions.each do |permission|
      can permission.action.to_sym, permission.thing_type.constantize do |thing|
        thing.nil? ||
        permission.thing_id.nil? ||
        permission.thing_id == thing.id
      end
    end
  end
end
    
