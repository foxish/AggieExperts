class Profile < ActiveRecord::Base
  has_many :pkeywords
  belongs_to :user
  attr_accessible :user_id, :name, :description, :phone, :email, :title, :website

  def self.get_profiles_by_keyword(term)
    @row = Keyword.get_match(term)
    @profiles = []
    @profiles2 = []
    @profiles1 = []
    unless @row.nil?
      @keyword_id = @row.id
      @profiles1 = self.joins('JOIN pkeywords ON profiles.user_id = pkeywords.user_id').
          where('pkeywords.keyword_id =?', @keyword_id).all || []

      @row1 = Status.where('status.code = ?', 'ACTIVE').first
      @row2 = User.where('users.status_id = ?', @row1['id']).all
      @profiles2 = []
      @row2.each do |r2|
        @profiles2 += Profile.where('profiles.user_id = ?', r2['id']) || []
      end
      @profiles = @profiles1 & @profiles2
    end
    return @profiles1
  end

  def self.format_phone(number)
    if number.match /\d{10}/
      phone_num = "("
      j=0;
      number.split('').each do |num|
        if j < 2
          phone_num = phone_num + num
        elsif j == 2
          phone_num = phone_num + num + ') '
        elsif j < 5
          phone_num = phone_num + num
        elsif j == 5
          phone_num = phone_num + num + '-'
        else
          phone_num = phone_num + num
        end
        j = j+1
      end
    end
    return phone_num || ""
  end
  
  def self.get_profiles_by_name(term)
    @term=term;
    @profiles=[]
    @profiles2 = []
    @profiles1 = []
    
    @profiles1=Profile.where('profiles.name LIKE ?','%'+ term +'%').all || []
    @row1=Status.where('status.code = ?', 'ACTIVE').first
    @row2=User.where('users.status_id = ?', @row1['id']).all
 
    @row2.each do |r2|  
      @profiles2 +=  Profile.where('profiles.user_id = ?', r2['id']) || []
    end
    @profiles=@profiles1 & @profiles2
    return @profiles
  end
  
  def self.get_profiles_by_desc(term)
    @profiles=[]
    @profiles1 = []
    @profiles2 = []
    @profiles1=Profile.where('profiles.description LIKE ?', '%'+ term +'%').all || []
    @row1=Status.where('status.code = ?', 'ACTIVE').first
    @row2=User.where('users.status_id = ?', @row1['id']).all

    @row2.each do |r2|
      @profiles2+= Profile.where('profiles.user_id=?',r2['id'] ).all || []
    end
      @profiles=@profiles1 & @profiles2
      return @profiles
    end
end

