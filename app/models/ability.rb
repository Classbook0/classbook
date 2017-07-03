class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, :to => :crud
    alias_action :create, :update, :destroy, :to => :cud
    alias_action :create, :read, :update, :to => :cru
    alias_action :update, :read, :to => :ur

    user ||= User.new
    caso = user.perfil
     case user.perfil?
     when 0 #ADM SISTEMA
           can :crud, :all
         when 1
           can :ur, :all
         when 2
           can :ur, :all
     end
  end
end
