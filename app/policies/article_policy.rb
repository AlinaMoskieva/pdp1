class ArticlePolicy < ApplicationPolicy
  def create?
    user
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  private

  def owner?
    user && record.user == user
  end
end
