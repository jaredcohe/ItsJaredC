class HomeController < ApplicationController
  #layout "public"
  #layout "public", :only => :home
  #layout "application", :only => :index
  
  before_filter :authorize, :except => [:home, :index]

  require 'uri'

  def index
    p current_user
    
    unless current_user
      #@destination_controller = params[:controller]
      #@destination_action = params[:action]
      #params[:destination_action] = params[:action]
      #params[:desination_controller] = params[:controller]

      @user = User.new
      render "/users/new", :layout => "bare"
      #redirect_to "/users/new", :jared => "hamb", @cohen => "blblbl", params[:destination_action] => "food"
      #:layout => "bare", :destination_action => params[:action], :destination_controller => params[:controller]
      p params
      #p :jared
      #p @cohen
      p "-----------------"
    end
  end

  def home
  end

  def input_scrape_knowledge

    form_inputs = {}
    form_inputs[:knowledge_url] = params[:url]

    knowledge_object = KnowledgeScraper.new(form_inputs[:knowledge_url])

    
    if knowledge_object.bad_url && (form_inputs[:knowledge_url] =~ URI::regexp).nil?
      # if URL doesnt scrape and doesnt look like URL
      redirect_to :back, flash[:notice] => "Please enter a valid URL, including http..."
    else # if either scrapes or looks like URL or both

      # get to root/provider URL
      form_inputs[:provider_url] = form_inputs[:knowledge_url][/.+\.[A-Za-z0-9]{2,4}\//]

      # get rid of http(s)
      knowledge_url_no_http = form_inputs[:knowledge_url].gsub("https://","").chomp(separator="/")
      knowledge_url_no_http = form_inputs[:knowledge_url].gsub("http://","").chomp(separator="/")

      # get rid of parameters
      # form_inputs[:knowledge_string_id] = knowledge_url_no_http.include?('?') ? knowledge_url_no_http.split('?').first : knowledge_url_no_http
      form_inputs[:knowledge_string_id] = knowledge_url_no_http
    
      # get to root/provider ID
      form_inputs[:provider_string_id] = form_inputs[:provider_url].gsub("https://","").chomp(separator="/")
      form_inputs[:provider_string_id] = form_inputs[:provider_url].gsub("http://","").chomp(separator="/")

      form_inputs[:title] = knowledge_object.title.blank? ? form_inputs[:knowledge_string_id] : knowledge_object.title.strip
      form_inputs[:description] = knowledge_object.description.blank? ? form_inputs[:title] : knowledge_object.description

      knowledge_search_results = Knowledge.where("string_id LIKE ?", "%#{form_inputs[:knowledge_string_id]}%")
      provider_search_results = Provider.where("string_id LIKE ?", "%#{form_inputs[:provider_string_id]}%")

      # search for knowledge_string_id
      if knowledge_search_results.empty?
        # return new knowlege if not already in database
        params.merge!(form_inputs)
        @knowledge = Knowledge.new(:title => form_inputs[:title], :url => form_inputs[:knowledge_url], :description => form_inputs[:description], :string_id => form_inputs[:knowledge_string_id])
        #10.times { @knowledge.tags.build }
        4.times { @knowledge.categorizations.build }

        # search for provider_string_id
        if provider_search_results.empty?
          # if provider not exist, build it
          @knowledge.providers.build(:name => form_inputs[:title], :url => form_inputs[:provider_url], :string_id => form_inputs[:provider_string_id], :description => form_inputs[:description])
          @knowledge.providers.build
        else
          # if provider exists, build association between knowledge and provider
          @knowledge.originations.build(:provider_id => provider_search_results.first.id)
          @knowledge.save
        end
        render 'knowledges/new'
      else
        # return the knowledge if it already exists
        redirect_to knowledge_path(knowledge_search_results.first.id)
      end # knowledge search loop
    end # url verify loop

  end # method loop

end

=begin
class KnowledgeScraper

  require 'nokogiri'
  require 'open-uri'
  require 'pp'

  attr_accessor(:title, :description, :keywords, :bad_url)

  def initialize(url)
    begin
      html = Nokogiri::HTML(open(url))
      @description = html.css("meta[name='description']").length > 0 ? html.css("meta[name='description']").first.attributes['content'].value : ""
      @title = html.css("title").text
      #@description = description.length > 1 ? description.first.attributes['content'].value : ''
      #@keywords = html.css("meta[name='keywords']").first.attributes['content'].value
      @bad_url = false
    rescue Exception
      @bad_url = true
    end
  end
end
=end