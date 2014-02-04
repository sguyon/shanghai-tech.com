class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities



    alias_action :update, :destroy, :to => :modify

    user ||= User.new # guest user (not logged in)
    

    if (user.admin==1) # admin can do everything
        can :read, :all 
        can :manage, :all 
        can :access, :rails_admin
        can :history
        can :access, :rails_admin   # grant access to rails_admin
        can :dashboard              # grant access to the dashboard

    else
        can :read,   [UserSession, User, Person, Company, Event, Job]
        can :create, [UserSession, User] # everyone can register or login
        can :create, [Person, Company, Event, Job] unless user.id.nil? # logged users can create content
        can :modify, User, :id => user.id # logged users can modify their user account
        can :modify, [Person, Company, Event, Job], :user_id => user.id # logged users can modify their content
        cannot :access, :rails_admin
        cannot :history
        cannot :dashboard
    end

  end
end
