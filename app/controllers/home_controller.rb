class HomeController < ApplicationController

  def index
  end

  def input_scrape_knowledge_url
    url = params[:url]
    p params
    p 'XXXXX0000000'
    p 'url'
    redirect_to :root
  end

end
