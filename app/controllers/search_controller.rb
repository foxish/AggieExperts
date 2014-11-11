class SearchController < ApplicationController
  def search
    @term = params[:term]
    @row = Keyword.where("keywords.key LIKE ?", '%'+@term+'%').first
    if not @row.nil?
      @id = @row.id
      @profiles = Profile.where(keyword_id: @ids).all 
      binding.pry
    end
    
  end
end
