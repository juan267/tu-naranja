class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :admin
        can :manage, :all
    elsif user.role? :farm_admin
        can :read, Farm
        can :manage, User
        can :manage, [Lote, SubLote]
    elsif user.role? :employee
        can :read, [Farm,User, Lote, SubLote]
        can :update, User, :user_id => user.id
    end
  end
end
