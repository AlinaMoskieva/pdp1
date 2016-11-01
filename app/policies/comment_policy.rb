class CommentPolicy < ApplicationPolicy
  def create?
    user
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end
end
