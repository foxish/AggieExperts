class SearchController < ApplicationController
  def search
    @term = params[:term]
    @profiles = []
    
    if not @term.nil?
      @profiles = Profile.get_profiles_by_keyword(@term)
      @keywords = {}
      @profiles.each do |profile|
          @keywords[profile.user_id] = Keyword.get_for_user(profile.user_id)
      end
    end
  end
end
