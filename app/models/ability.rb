class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, :to => :crud
    alias_action :create, :update, :destroy, :to => :cud
    alias_action :create, :read, :update, :to => :cru
    alias_action :update, :read, :to => :ur

    #user ||= User.new
    caso = user.perfil
     case user.perfil
        when "Administrador" #ADM SISTEMA
           can :crud, :all
         when "Profesor"
           can :ur, :all
         when "Alumno"
           can :ur, :all
     end
  end
end
