class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    if user.role == "adm"
      can :manage, :all
    elsif user.role == "atentente"
      can [:create,:read,:update,:destroy], Visitor
      can [:create,:read,:update,:destroy], Visit
      can [:read, :update], User, id: user.id
    elsif user.role == "funcionario"
      can [:read], Visitor
      can [:read], Visit
    end
  end
end

