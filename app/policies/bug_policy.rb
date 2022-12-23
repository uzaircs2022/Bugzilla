class BugPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(user, bug)
    @user = user
    @bug = bug
  end

  def new?
    if @user.usertype == 'QA' && @user.project_assigned.include?(@bug.project)
      return true
    end

    false
  end

  def create?
    if @user.usertype == 'QA' && @user.project_assigned.include?(@bug.project)
      return true
    end

    false
  end

  def edit?
    return true if @bug.reported_by == @user

    false
  end

  def update?
    if  (@user.usertype =='Developer' && @user.project_assigned.include?(@bug.project)) || @bug.reported_by == @user
      return true
    end

    false
  end

  def delete?
    if @bug.reported_by == @user
      return true
    end

    false
  end

end
