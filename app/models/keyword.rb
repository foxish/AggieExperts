class Keyword < ActiveRecord::Base
    attr_accessible :key
    validates :key, presence: true
  	validates :key, uniqueness: true
  	has_many :pkeywords

    def self.get_match(term)
        @row = Keyword.where("keywords.key LIKE ?", '%'+ term +'%').first
    end
    
    def self.get_for_user(user_id)
      keywords = self.joins('JOIN pkeywords ON pkeywords.keyword_id = keywords.id').
                       where('pkeywords.user_id = ?', user_id).all
      return keywords
    end
    
    def capitalize
      return self.key.to_str.capitalize
    end
end
