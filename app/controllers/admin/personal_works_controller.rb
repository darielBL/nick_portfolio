class Admin::PersonalWorksController < ApplicationController
  before_action :authenticate_user!

  def create
    @work = PersonalWork.new(personal_params)
    @work.email = About.singleton.email

    if @work.save
      redirect_to admin_dashboard_path, notice: 'Trabajo personal añadido'
    else
      redirect_to admin_dashboard_path, alert: 'Error: ' + @work.errors.full_messages.join(', ')
    end
  end

  def destroy
    @work = PersonalWork.find(params[:id])
    @work.image.purge if @work.image.attached? # Eliminar el archivo adjunto
    @work.destroy
    redirect_to admin_dashboard_path, notice: 'Trabajo eliminado'
  end

  private

  def personal_params
    params.require(:personal_work).permit(:title, :image)
  end

  def authenticate_user!
    unless session[:user_id] && User.find_by(id: session[:user_id])
      redirect_to root_path, alert: 'Por favor inicia sesión'
    end
  end
end