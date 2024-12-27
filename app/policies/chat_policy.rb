class ChatPolicy < ApplicationPolicy
  def show?
    @user.in_chat? @record
  end

  # allow users to create new chats for now
  def new?
    create?
  end

  def create?
    @user.admin?
  end

  def edit?
    update?
  end

  def update?
    true
  end

  def destroy?
    create?
  end
end
