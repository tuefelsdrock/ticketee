class TicketsController < ApplicationController

  before_filter :find_project


  def new

    # The build method simply instantiates a new record for the tickets association on the
    # @project object.

    @ticket = @project.tickets.build

  end



  private
    def find_project
      @project = Project.find(params[:project_id])
  end

end
