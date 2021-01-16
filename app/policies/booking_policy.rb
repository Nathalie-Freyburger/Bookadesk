class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    is_user_booking?
  end

  def show?
    true
  end

  def destroy?
    is_user_booking?
  end

  private

  def is_user_booking?
    user == record.user
  end
end
