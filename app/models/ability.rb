class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :admin
        can :manage, :all
    elsif user.role? :farm_admin
        can :read, Farm
        can :manage, User
        can :manage, Lote
    elsif user.role? :employee
        can :read, [Farm,User]
        can :update, User, :user_id => user.id
    end
  end
end
