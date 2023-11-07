class SearchesController < ApplicationController
  def search

    @search_target = params[:search_target]
    @search_method = params[:search_method]
    @query = params[:query]
    if @search_target == "posts"
      case @search_method
        when "exact"
          @results = Book.where("title": @query)
        when "prefix"
          @results = Book.where("title LIKE ?", "#{@query}%")
        when "suffix"
          @results = Book.where("title LIKE ?", "%#{@query}")
        when "partial"
          @results = Book.where("title LIKE ?", "%#{@query}%")
      else
      end
    elsif @search_target == "users"
      case @search_method
        when "exact"
          @results = User.where("name": @query)
        when "prefix"
          @results = User.where("name LIKE ?", "#{@query}%")
        when "suffix"
          @results = User.where("name LIKE ?", "%#{@query}")
        when "partial"
          @results = User.where("name LIKE ?", "%#{@query}%")
        else
      end
    end

  end
end
