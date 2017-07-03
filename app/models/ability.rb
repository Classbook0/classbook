class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, :to => :crud
    alias_action :create, :update, :destroy, :to => :cud
    alias_action :create, :read, :update, :to => :cru
    alias_action :update, :read, :to => :ur
    alias_action :update, :delete, :to => :du

    user ||= User.new
    caso = user.perfil
     case user.perfil
        when "Administrador" #ADM SISTEMA
           can :crud, :all
           can :du, :all
         when "Profesor"
           can :ur, :all
           can :du, :all
           can :du, Note
         when "Alumno"
           can :ur, Curso
           cannot :du, Curso
           can :ur, Note
           cannot :du, Note
     end
  end
end
