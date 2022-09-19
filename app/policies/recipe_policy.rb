class RecipePolicy < ApplicationPolicy
  def filter?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    true
  end

  def delete?
    true
  end
end
