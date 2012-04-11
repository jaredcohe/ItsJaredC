class ApplicationController < ActionController::Base
  # these methods are available to every controller, need helper_method to make the visible to views

  protect_from_forgery
  
  private

  def current_user
    #@current_user ||= User.find(session[:user_id]) if session[:user_id]
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  helper_method :current_user #makes current_user method available in the view
  
  protected
  
  def authorize
    unless admin?
      flash[:error] = "unauthorized access"
      redirect_to :access_denied
      false
    end
  end

  def admin?
    admin_array = [1,8]
    admin_array.include?(current_user.id) if current_user

    # request.remote_ip == "127.0.0.1"
    # true
    # current_user.admin? based on attribute in table
  end
end

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