class Admin::SocialLinksController < ApplicationController
  before_action :authenticate_user!

  def update_all
    params[:social_links].each do |_, link_params|
      link = SocialLink.find(link_params[:id])
      link.update(url: link_params[:url])
    end

    redirect_to admin_dashboard_path, notice: 'Redes sociales actualizadas'
  end

  private

  def authenticate_user!
    unless session[:user_id] && User.find_by(id: session[:user_id])
      redirect_to login_path
    end
  end
end