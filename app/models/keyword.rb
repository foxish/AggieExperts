class Keyword < ActiveRecord::Base
    attr_accessible :key
    def self.get_match(term)
        @row = Keyword.where("keywords.key ILIKE ?", '%'+ term +'%').first
    end
    
    def self.get_for_user(user_id)
      keywords = self.joins('JOIN pkeywords ON pkeywords.keyword_id = keywords.id').
                       where('pkeywords.user_id = ?', user_id).all
      return keywords
    end
end
