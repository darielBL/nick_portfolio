class Admin::SocialLinksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_social_link, only: [:destroy]

  def index
    @social_links = SocialLink.all.order(:position)
  end

  def create
    @social_link = SocialLink.new(social_link_params)

    # Asignar posición automáticamente (al final)
    @social_link.position = SocialLink.maximum(:position).to_i + 1

    if @social_link.save
      redirect_to admin_dashboard_path, notice: 'Red social añadida correctamente'
    else
      redirect_to admin_dashboard_path, alert: 'Error: ' + @social_link.errors.full_messages.join(', ')
    end
  end

  def update_all
    params[:social_links].each do |_, link_params|
      link = SocialLink.find(link_params[:id])
      link.update(url: link_params[:url])
    end

    redirect_to admin_dashboard_path, notice: 'Redes sociales actualizadas'
  end

  def destroy
    @social_link.destroy
    redirect_to admin_dashboard_path, notice: 'Red social eliminada correctamente'
  end

  private

  def set_social_link
    @social_link = SocialLink.find(params[:id])
  end

  def social_link_params
    params.require(:social_link).permit(:platform, :url, :icon, :label)
  end

  def authenticate_user!
    unless session[:user_id] && User.find_by(id: session[:user_id])
      redirect_to login_path
    end
  end
end