class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user
    
    if user.has_role? :admin
      can :manage, :all
    else
      can :read, :all
      can :create, Country
      can :update, Country do |country|
        country.try(:user) == user || user.has_role?(:admin)
      end
      # if user.role?(:author)
      #   can :create, Article
      #   can :update, Article do |article|
      #     article.try(:user) == user
      #   end
      end
    end
  end

