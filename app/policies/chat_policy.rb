class ChatPolicy < ApplicationPolicy
  def show?
    @user.chats.include? @record
  end

  # allow users to create new chats for now
  def new?
    create?
  end

  def create?
    true
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
