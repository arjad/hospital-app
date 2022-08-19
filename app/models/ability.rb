class Ability
  include CanCan::Ability

  def initialize(user)
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    if user.usertype == "admin"
      can :manage, :all
    elsif user.usertype == "doctor"

      can :read, :all
      cannot :create, Request
      can :update, Request
      cannot :destroy, Request

      cannot :create, Treatment
      cannot :update, Treatment
      cannot :delete, Treatment

      cannot :manage, Hospital

    elsif user.usertype == "patient"

      can :read, :all
      can :manage, Request
      cannot :update, Request
      can :destroy, Request

      cannot :create, Treatment
      cannot :update, Treatment
      cannot :delete, Treatment

      cannot :read, Hospital
      cannot :manage, Hospital
     
    else
      puts "======== unknown"
      puts "======== un"
      puts "======== un"
    end


  end
end
