class Profile < ActiveRecord::Base
  has_many :pkeywords
  attr_accessible :user_id, :fname, :lname, :description, :phone, :email

  def self.get_profiles_by_keyword(term)
    @row = Keyword.get_match(term)
    @profiles = []
    
    if not @row.nil?
      @keyword_id = @row.id
      @profiles = self.joins('JOIN pkeywords ON profiles.user_id = pkeywords.user_id').
                       where('pkeywords.keyword_id = ?', @keyword_id).all || []
    end
    return @profiles
  end

  def self.keywords(id)
    sql = "SELECT key
  FROM keywords JOIN pkeywords ON keywords.id = pkeywords.keyword_id
  JOIN profiles ON profiles.user_id = pkeywords.user_id
  WHERE profiles.user_id = #{id};"
    return ActiveRecord::Base.connection.execute(sql).map { |r| r['key']}
  end

  def self.keywords_as_string(id)
    keys = self.keywords(id)
    keywords = keys[0]
    for i in 1..(keys.size() - 1)
      keywords = keywords + ', ' + keys[i]
    end
    return keywords
  end
end

