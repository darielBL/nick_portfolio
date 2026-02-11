class Admin::DashboardController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  before_action :set_about

  def index
    @portfolio_images = PortfolioImage.all
    @personal_works = PersonalWork.all
    @social_links = SocialLink.all.order(:position)
  end

  def update_about
    if @about.update(about_params)
      # Actualizar email en TODAS las imágenes
      PortfolioImage.update_all(email: @about.email)
      PersonalWork.update_all(email: @about.email)

      redirect_to admin_dashboard_path, notice: 'About Me actualizado correctamente'
    else
      redirect_to admin_dashboard_path, alert: 'Error al actualizar'
    end
  end

  private

  def set_about
    @about = About.singleton
  end

  def about_params
    params.require(:about).permit(:description, :email, :image)
  end

  def authenticate_user!
    unless session[:user_id] && User.find_by(id: session[:user_id])
      redirect_to root_path, alert: 'Por favor inicia sesión'
    end
  end
end