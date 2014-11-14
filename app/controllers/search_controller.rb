class SearchController < ApplicationController
  def search
    @term = params[:term]
    if not @term.nil?
      @profiles = Profile.get_profiles_by_keyword(@term) || []
      logger.debug(@profiles)
      
      @keywords = {}
      @profiles.each do |profile|
          @keywords[profile.user_id] = Keyword.get_for_user(profile.user_id)
      end
      logger.debug(@keywords)
    end
    @profiles = @profiles || []
  end
end
