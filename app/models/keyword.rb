class Keyword < ActiveRecord::Base
    attr_accessible :key
  	has_many :pkeywords
    validates :key, uniqueness: true, format: { with: /\w+\s*?\w+?\s*?\w+/,
       message: "Keyword should be atleast 3 characters long" }

    def self.get_match(term)
        @row = Keyword.where("keywords.key LIKE ?", '%'+ term +'%').first
    end
    
    def self.get_for_user(user_id)
      keywords = self.joins('JOIN pkeywords ON pkeywords.keyword_id = keywords.id').
                       where('pkeywords.user_id = ?', user_id).all
      return keywords
    end
    
    def capitalize
      self.key.to_str.capitalize
    end
end
