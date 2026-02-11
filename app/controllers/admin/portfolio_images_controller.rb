class Admin::PortfolioImagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @image = PortfolioImage.new(portfolio_params)
    @image.email = About.singleton.email

    if @image.save
      redirect_to admin_dashboard_path, notice: 'Imagen añadida correctamente'
    else
      redirect_to admin_dashboard_path, alert: 'Error: ' + @image.errors.full_messages.join(', ')
    end
  end

  def destroy
    @image = PortfolioImage.find(params[:id])
    @image.image.purge if @image.image.attached? # Eliminar el archivo adjunto
    @image.destroy
    redirect_to admin_dashboard_path, notice: 'Imagen eliminada'
  end

  private

  def portfolio_params
    params.require(:portfolio_image).permit(:title, :image)
  end

  def authenticate_user!
    unless session[:user_id] && User.find_by(id: session[:user_id])
      redirect_to root_path, alert: 'Por favor inicia sesión'
    end
  end
end