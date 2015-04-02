class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :access, :rails_admin   # grant access to rails_admin
    if user.role? :admin
        can :manage, :all
        can :access, :rails_admin   # grant access to rails_admin
        can :dashboard
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
