class OfficePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    is_user_office?
  end

  def show?
    true
  end

  def destroy?
    is_user_office?
  end

  private

  def is_user_office?
    user == record.user
  end
end
