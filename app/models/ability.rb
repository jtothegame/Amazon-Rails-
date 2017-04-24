class Ability
  include CanCan::Ability

    def initialize(user)
      # as per comments above 'user' here refers to 'current_user'

      # if the user is not logged in which means 'user' comes as 'nil' then 'user' will be assigned to 'User.new'. This is useful so that we don't have to check if 'user' is 'nil' all the time.
      user ||= User.new

      if user.is_admin?
        # this gives the admin user super powers by enabling them to perform any action on any model.
        can :manage, :all
      end

      # define abilities to prevent users from liking their own questions
      can :like, Review do |r|
        user != r.user
      end

      cannot :like, Review do |r|
        user == r.user
      end

      # in this example we're saying that the user can edit a question if the user is the owner(creator) of that question.
      can [:edit, :destroy], Product do |product|
        product.user == user
      end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
