class SearchController < ApplicationController
  def search
    @term = params[:term]
    @profiles = []
    @istermnull = 0
    
     if @term ==" "
      @istermnull = 1   
    elsif @term.length <=2
      @istermnull = 1
      
    else
      @profiles=Profile.get_profiles_by_keyword(@term)
      @profiles += Profile.get_profiles_by_name(@term)
      @profiles += Profile.get_profiles_by_desc(@term)
      splitterms = @term.split(" ")
      
      splitterms.each do |splitterm|
        @profiles+=Profile.get_profiles_by_keyword(splitterm)
         
        @profiles += Profile.get_profiles_by_name(splitterm)
        
        @profiles += Profile.get_profiles_by_desc(splitterm)
          end
      
      @profiles.uniq!
      @keywords = {}
      @profiles.each do |profile|
          @keywords[profile.user_id] = Keyword.get_for_user(profile.user_id)
      end
    end
  end
end
