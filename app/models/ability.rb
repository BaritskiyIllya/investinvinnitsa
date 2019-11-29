class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :index, :show, :new, :edit, :create, :update, :destroy, to: :crud
    #
    # can :crud, ProblemInformation, user_id: user.id if user.has_any_role?(:moderator)
    #
    if user.moderator?
      can %i[index show edit update destroy], [ProductionArea, LandArea, OfficeArea, InvestProject]
      can %i[index new edit create update destroy], [MapLayer, MapLayerGroup]
      can [:index, :show], [PotentialInvestor, SubmissionProject]
      can :crud, [User, Balancer, CommunalArea, Transport, Ownership, InfrastructureType]
      can :index, AreaLog
    end

    if user.questionnaire?
      can %i[index show new create], ProductionArea if user.balancer
      can %i[index show new create], LandArea if user.balancer
      can %i[index show new create], OfficeArea if user.balancer
      can %i[index show new create], InvestProject if user.balancer
      can %i[edit update destroy], ProductionArea, state: %w[draft unverified] if user.balancer
      can %i[edit update destroy], LandArea, state: %w[draft unverified] if user.balancer
      can %i[edit update destroy], OfficeArea, state: %w[draft unverified] if user.balancer
      can %i[edit update destroy], InvestProject, state: %w[draft unverified] if user.balancer
    end

    if user.admin?
      can [:index, :show], [PotentialInvestor, SubmissionProject]
      can :crud, Balancer
    end

    #
    # can %i[create by_chat_room], ChatMessage if user.has_any_role?(:super_moderator, :moderator)
    # can :check_render_permition, ChatRoom if user.has_any_role?(:super_moderator, :moderator)

    # Define abilities for the passed in user here. For example:
    #
      # user ||= User.new # guest user (not logged in)
    #     can :read, :all
    #   end
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
