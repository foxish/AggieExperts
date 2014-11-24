class Profile < ActiveRecord::Base
  has_many :pkeywords
  belongs_to :user
  attr_accessible :user_id, :name, :description, :phone, :email

  def self.get_profiles_by_keyword(term)
    @row = Keyword.get_match(term)
    @profiles = []
    
    if not @row.nil?
      @keyword_id = @row.id
      @profiles = self.joins('JOIN pkeywords ON profiles.user_id = pkeywords.user_id').
                       where('pkeywords.keyword_id =?', @keyword_id ).all || []
    end
    return @profiles
  end
  
  def self.get_profiles_by_name(term)
  @term=term;
  @profiles=[]
  
  #@profiles=Profile.where('profiles.name LIKE ?','%'+term+'%').all || []
  
  @row1=Status.where('status.code =?', 'ACTIVE').first
  @row2=User.where('users.status_id=?', @row1.id).first
  
  @profiles=Profile.where('profiles.name LIKE ?','%'+term+'%') and Profile.where('profiles.user_id=?',@row2.id ).all || []
  return @profiles
  end
  
  def self.get_profiles_by_desc(term)
 
  @profiles=[]
  @profiles=Profile.where('profiles.description LIKE ?', '%'+ term +'%').all || []
  return @profiles
  end
  
end

