class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(user, project)
    @user = user
    @project = project
  end

  def new?
    if @user.usertype == 'Manager'
      return true
    end

    false
  end

  def create?
    if @user.usertype == 'Manager'
      return true
    end

    false
  end

  def show?
    if @user == @project.creator || @project.assigned_user.include?(@user) || @user.usertype == 'QA'
      return true
    end

    false
  end

  def update?
    if @user == @project.creator && @user.usertype == 'Manager'
      return true
    end

    false
  end

  def edit?
    if @user == @project.creator && @user.usertype == 'Manager'
      return true
    end

    false
  end

  def delete?
    if @user == @project.creator && @user.usertype =='Manager'
      return true
    end

    false
  end
end
