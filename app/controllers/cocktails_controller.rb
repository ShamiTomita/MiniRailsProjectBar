class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def initialize_search
    @cocktails = Cocktail.all
    session[:search_name] ||= params[:search_name]
    session[:filter] = params[:filter]
    params[:filter_option] = nil if params[:filter_option] == ""
    session[:filter_option] = params[:filter_option]
  end
end
