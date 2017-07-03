class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_filter :authenticate_scope! #este se ocupa solo para que los usuarios se registren antes de esta accion
  skip_before_filter :require_no_authentication #esto permite saltarse la autenticacion

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    @user = User.new(email: sign_up_params[:email], password: sign_up_params[:password], perfil: sign_up_params[:perfil])
    if @user.save
        redirect_to new_user_registration_path, notice: "Usuario creado correctamente"
    end
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at,
      :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip,
      :last_sign_in_ip, :created_at, :updated_at, :perfil])
  end

  def after_sign_up_path_for(resource)
    redirect_to new_user_registration_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
