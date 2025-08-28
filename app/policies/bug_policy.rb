# app/policies/bug_policy.rb
class BugPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  attr_reader :user, :bug

  def initialize(user, bug)
    @user = user
    @bug = bug
  end

  def new?
    qa_on_project?
  end

  def create?
    qa_on_project?
  end

  def edit?
    bug.reported_by == user
  end

  def update?
    developer_on_project? || bug.reported_by == user
  end

  def destroy?
    bug.reported_by == user
  end

  private

  def qa_on_project?
    user.usertype == "QA" && user.project_assigned.include?(bug.project)
  end

  def developer_on_project?
    user.usertype == "Developer" && user.project_assigned.include?(bug.project)
  end
end
