class SearchController < ApplicationController
  def search
    @term = params[:term]
  end
end
