# app/controllers/bugs_controller.rb
class BugsController < ApplicationController
  before_action :set_project
  before_action :set_bug, only: [:show, :edit, :update, :destroy, :bug_assignment, :status]

  def index
    @bugs = @project.bugs
  end

  def show; end

  def new
    @bug = @project.bugs.new
    authorize @bug
  end

  def create
    @bug = @project.bugs.new(bug_params)
    @bug.reported_by = current_user
    authorize @bug

    if @bug.save
      redirect_to [@project, @bug], notice: "Bug successfully reported."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @bug
  end

  def update
    authorize @bug
    if @bug.update(bug_params)
      redirect_to [@project, @bug], notice: "Bug successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @bug
    @bug.destroy
    redirect_to project_bugs_path(@project), notice: "Bug successfully destroyed."
  end

  def bug_assignment
    authorize @bug, :assign?

    if @bug.assigned_to_id.blank?
      @bug.update(assigned_to: current_user)
      flash[:notice] = "Bug assigned to you."
    else
      flash[:alert] = "Bug is already assigned."
    end

    redirect_to [@project, @bug]
  end

  def status
    authorize @bug, :update_status?

    if @bug.update(status: params[:status])
      flash[:notice] = "Bug status updated."
    else
      flash[:alert] = "Unable to update bug status."
    end

    redirect_to [@project, @bug]
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_bug
    @bug = @project.bugs.find(params[:id])
  end

  def bug_params
    params.require(:bug).permit(:title, :description, :deadline, :bugtype, :status, :image)
  end
end
