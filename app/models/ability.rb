class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :admin
        can :manage, :all
    elsif user.role? :farm_admin
        can :read, [Farm] do |farm|
            user.farm.id = farm.id
        end
        can :manage, User
    elsif user.role? :employee
        can :read, [Farm,User]
        can :update , User, :user_id => user.id
    end
  end
end
