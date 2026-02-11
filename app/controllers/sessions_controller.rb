class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]

  def new
    # Ya no se usa - el modal no necesita esta acción
    head :ok
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      respond_to do |format|
        format.html { redirect_to admin_dashboard_path, notice: 'Sesión iniciada' }
        format.json { render json: { success: true, redirect: admin_dashboard_path } }
      end
    else
      respond_to do |format|
        format.html {
          flash[:alert] = 'Email o contraseña incorrectos'
          redirect_to root_path
        }
        format.json { render json: { success: false, error: 'Credenciales incorrectas' }, status: :unauthorized }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Sesión cerrada'
  end
end