class HomeController < ApplicationController

require 'nokogiri'
require 'open-uri'
require 'pp'

  def index
  end

  def input_scrape_knowledge
    url = params[:url]
    p url

    scrape_knowledge(url)
    
    p params
    p 'XXXXX0000000'
    p url
    redirect_to :root
  end

  def scrape_knowledge(url)
    html = Nokogiri::HTML(open(url))
    p "JJJJJJJJJ"
    output_file = File.open('a', 'w')
    output_file.puts html
    output_file.close
    pp html
  end

end
