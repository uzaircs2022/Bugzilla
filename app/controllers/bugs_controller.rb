class BugsController < ApplicationController
  before_action :bug_project

  def index
    @bugs = @project.bugs
  end

  def show
    @bug = @project.bugs.find(params[:id])
  end

  def new
    @bug = @project.bugs.new
    authorize @bug
  end

  def create
    @bug = @project.bugs.new(bug_params)
    @bug.reported_by = current_user

    if @bug.save
      redirect_to [@project, @bug], notice: 'Bug successfully Reported.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @bug = @project.bugs.find(params[:id])
    authorize @bug
  end

  def update
    @bug = @project.bugs.find(params[:id])
    if @bug.update(bug_params)
      redirect_to [@project, @bug]
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bug = @project.bugs.find(params[:id])
    @bug.destroy
    redirect_to [@project, Bug] , notice: 'Bug successfully destroyed.'
  end

  def bug_assignment
    if @project
      @bug = @project.bugs.find(params[:id])
      if @bug
        if !(@bug.assigned_to_id)
          @bug.assigned_to = current_user
          @bug.save
        end
      end
    end
    redirect_to [@project, @bug]
  end

  def status
    @bug = @project.bugs.find(params[:id])
    if @project && @bug
      @bug.status = params[:status]
      @bug.save
    end
    redirect_to  [@project, @bug]
  end

  private

  def bug_project
    @project = Project.find(params[:project_id])
  end

  def bug_params
    params.require(:bug).permit(:title, :description, :deadline, :bugtype, :status, :image )
  end
end
