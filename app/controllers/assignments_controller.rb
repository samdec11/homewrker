class AssignmentsController < ApplicationController
  def index
    @assignments = Assignment.order(:name)
  end
  def show
    @assignment = Assignment.find(params[:id])
    @groups = @assignment.groups.order(:created_at)
  end

  def new
    @assignment = Assignment.new
  end
  def create
    @assignment = Assignment.create(params[:assignment])
    @assignments = Assignment.order(:name)

  end
end