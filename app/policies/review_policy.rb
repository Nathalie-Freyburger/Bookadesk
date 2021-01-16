class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def create?
    true
  end

  def update?
    is_user_review?
  end

  def show?
    true
  end

  def destroy?
    is_user_review?
  end

  private

  def is_user_review?
    user == record.booking.user
  end
end
