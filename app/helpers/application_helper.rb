module ApplicationHelper

  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Ticketee").join(" - ") unless parts.empty?
      end
    end
  end

  # The admins_only method takes a block.
  # call block.call, which runs the speci-
  # fied block but only if current_user.try(:admin?) returns a value that evaluates to
  # true. This try method tries a method on an object, and if that method doesn’t exist
  # (as it wouldn’t if current_user were nil), then it returns nil. At the end of the
  # method, you return nil so the content doesn’t show again.
  #
  def admins_only(&block)
    block.call if current_user.try(:admin?)
    nil
  end

  def authorized?(permission, thing, &block)
    block.call if can?(permission.to_sym, thing) ||
    current_user.try(:admin?)
    nil
  end


end
