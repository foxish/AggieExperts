class SearchController < ApplicationController
  def search
    @term = params[:term]
    @row = Keyword.where("keywords.key LIKE ?", '%'+@term+'%').first
    if not @row.nil?
      @keyword_id = @row.id
      @profiles = Profile.joins('JOIN pkeywords ON profiles.user_id = pkeywords.user_id').
                       where('pkeywords.keyword_id = ?', @keyword_id).all
      logger.debug(@users)
    end
    @profiles = [] unless @profiles
  end
end
