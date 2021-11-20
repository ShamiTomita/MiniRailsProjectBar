class CocktailsController < ApplicationController
  before_action :initialize_search

  def index
    handle_search_name
    handle_filters
  end

  def clear
    clear_session(:search_name, :filter_name, :filter)
    redirect_to cocktails_path
  end

  def initialize_search
    session[:search_name] ||= params[:search_name]
    session[:filter] = params[:filter]
  end

  def handle_search_name
    if session[:search_name]
        @cocktail = Cocktail.where("name LIKE ?", "%#{session[:search_name]}%")
    end
  end

  def handle_filters
      ing = params[:filter]
      @cocktails = []
      Cocktail.all.each do |cocktail|
        if cocktail.ingredients.include?(ing)
          @cocktails << cocktail
        end
      end
    end
  end
