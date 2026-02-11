class HomeController < ApplicationController
  layout 'public'

  def index
    @about = About.singleton
    @portfolio_images = PortfolioImage.all
    @personal_works = PersonalWork.all
    @social_links = SocialLink.all
    @section = params[:section] || 'portfolio'  # 👈 Esto es CRITICAL

    @footer_items = [
      { name: 'nick nightin', email: @about.email },
      { name: 'nick nightin', email: @about.email },
      { name: 'nicks nightin', email: @about.email },
      { name: 'nick nightin', email: @about.email }
    ]
  end

  def about
    @about = About.singleton
    @social_links = SocialLink.all
    @section = 'about'  # 👈 Asegura la sección

    if turbo_frame_request?
      render partial: 'home/about', locals: { about: @about, social_links: @social_links }
    else
      redirect_to root_path(section: 'about', anchor: 'about')
    end
  end

  def portfolio
    @images = PortfolioImage.all
    @about = About.singleton

    if turbo_frame_request?
      render partial: 'portfolio_gallery', locals: { images: @images }
    else
      redirect_to root_path(section: 'portfolio')
    end
  end

  def personal
    @works = PersonalWork.all
    @about = About.singleton

    if turbo_frame_request?
      render partial: 'personal_gallery', locals: { works: @works }
    else
      redirect_to root_path(section: 'personal')
    end
  end
end