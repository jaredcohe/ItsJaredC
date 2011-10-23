class HomeController < ApplicationController

  require 'uri'

=begin
  def test(url)
    uri = URI.parse(url)

    http = Net::HTTP.new(uri.host, uri.port)
    p http
    p 'uuuuuuuuuuuuuuuuuuu'
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    p response.code
    p "-------------------"
    
    html = Nokogiri::HTML(open(url))
    p html.css("title").text
  end
=end

  def index
  end

  def input_scrape_knowledge

    form_inputs = {}
    form_inputs[:knowledge_url] = params[:url]

    #if (form_inputs[:knowledge_url] =~ URI::regexp).nil?
    #  redirect_to :back, flash[:notice] => "Please enter a valid URL, including http..."

    knowledge_object = KnowledgeScraper.new(form_inputs[:knowledge_url])

    #p knowledge_object
    #p "000000000000000"
    #p form_inputs[:knowledge_url]

    if knowledge_object.bad_url # test URL
      # if URL doesn't work
      redirect_to :back, flash[:notice] => "Please enter a valid URL, including http..."
    else # if URL was valid and scraped
      form_inputs[:title] = knowledge_object.title.strip
      form_inputs[:description] = knowledge_object.description.blank? ? form_inputs[:title] : knowledge_object.description

      #p form_inputs[:title]
      #p form_inputs[:description]
      #p "1111111111111111"

      # get to root/provider URL
      form_inputs[:provider_url] = form_inputs[:knowledge_url][/.+\.[A-Za-z0-9]{2,4}\//]

      #p form_inputs[:provider_url]
      #p form_inputs[:knowledge_url]

      # get rid of http(s)
      knowledge_url_no_http = form_inputs[:knowledge_url].gsub("https://","").chomp(separator="/")
      knowledge_url_no_http = form_inputs[:knowledge_url].gsub("http://","").chomp(separator="/")

      # get rid of parameters
      # form_inputs[:knowledge_string_id] = knowledge_url_no_http.include?('?') ? knowledge_url_no_http.split('?').first : knowledge_url_no_http
      form_inputs[:knowledge_string_id] = knowledge_url_no_http
    
      # get to root/provider ID
      form_inputs[:provider_string_id] = form_inputs[:provider_url].gsub("https://","").chomp(separator="/")
      form_inputs[:provider_string_id] = form_inputs[:provider_url].gsub("http://","").chomp(separator="/")

      knowledge_search_results = Knowledge.where("string_id LIKE ?", "%#{form_inputs[:knowledge_string_id]}%")
      provider_search_results = Provider.where("string_id LIKE ?", "%#{form_inputs[:provider_string_id]}%")

      # search for knowledge_string_id
      if knowledge_search_results.empty?
        # return new knowlege if not already in database
        params.merge!(form_inputs)
        @knowledge = Knowledge.new(:title => form_inputs[:title], :url => form_inputs[:knowledge_url], :description => form_inputs[:description], :string_id => form_inputs[:knowledge_string_id])
        #10.times { @knowledge.tags.build }
        2.times { @knowledge.categorizations.build }

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
  p "home controller, input_scrape_knowledge method"
  p params

  end # method loop

end

class KnowledgeScraper

  require 'nokogiri'
  require 'open-uri'
  require 'pp'

  attr_accessor(:title, :description, :keywords, :bad_url)

  def initialize(url)
    begin
      html = Nokogiri::HTML(open(url))
      description = html.css("meta[name='description']")
      @title = html.css("title").text
      @description = description.length > 1 ? description.first.attributes['content'].value : ''
      #@keywords = html.css("meta[name='keywords']").first.attributes['content'].value
      @bad_url = false
      #rescue NoMethodError
    rescue Exception
      @bad_url = true
    end
  end
end