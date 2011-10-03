class HomeController < ApplicationController

  def index
  end

  def input_scrape_knowledge
    form_inputs = {}
    form_inputs[:url] = params[:url]
    knowledge_object = KnowledgeScraper.new(form_inputs[:url])
    form_inputs[:title] = knowledge_object.title
    form_inputs[:description] = knowledge_object.description
    #form_inputs[:keywords] = knowledge_object.keywords
    p form_inputs
    p "333333333333"
    params.merge!(form_inputs)
    p params
    @knowledge = Knowledge.new(:title => form_inputs[:title], :url => form_inputs[:url], :description => form_inputs[:description])
    2.times { @knowledge.providers.build }
    p @knowledge
    p @knowledge.providers
    render 'knowledges/new'
  end

end

class KnowledgeScraper

  require 'nokogiri'
  require 'open-uri'
  require 'pp'

  # test sample http://dev.opera.com/articles/view/css-3-attribute-selectors/
  attr_accessor(:title, :description, :keywords)

  def initialize(url)
    html = Nokogiri::HTML(open(url))
    output_file = File.open('a1a1a_file_name', 'w')
    output_file.puts html
    output_file.close
    
    @title = html.css("title").text
    @description = html.css("meta[name='description']").first.attributes['content'].value
    #@keywords = html.css("meta[name='keywords']").first.attributes['content'].value
  end
end