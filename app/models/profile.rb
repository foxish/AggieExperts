class Profile < ActiveRecord::Base
  has_many :pkeywords
  belongs_to :user
  attr_accessible :user_id, :name, :description, :phone, :email, :title, :website
 @profiles = []
  def self.get_profiles_by_keyword(term)
    @row = Keyword.get_match(term)
    @profiles = []
    @profiles2 = []
    @profiles1 = []
    @row1 = []
    @row2 = []
    unless @row.nil?
      @keyword_id = @row.id
      @row1 = Status.where('status.code = ?', 'ACTIVE').first
      @rowid = @row1.id
      
      @profiles1 = self.joins('JOIN pkeywords ON profiles.user_id = pkeywords.user_id JOIN users on profiles.user_id = users.id').
          where('pkeywords.keyword_id =?', @keyword_id).where("users.status_id= ?",@rowid).all( :order => 'profiles.name') || []
         
      
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
    
    @profiles1 = []
    
          @row1 = Status.where('status.code = ?', 'ACTIVE').first
          @rowid = @row1.id
          
        @profiles1= self.joins('JOIN users ON profiles.user_id = users.id').where( "profiles.name LIKE ?",'%'+ term +'%').where(" users.status_id= ?",@rowid).all(:order=>'profiles.name') || []
        
      
    return @profiles1
  end
  
  def self.get_profiles_by_desc(term)
   # @profiles=[]
    @profiles1 = []
    @profiles2 = []
    
    @row1=Status.where('status.code = ?', 'ACTIVE').first
    @rowid=@row1.id
    @profiles1=self.joins('JOIN users ON profiles.user_id = users.id').where("profiles.description LIKE ?",'%'+ term +'%').where("users.status_id= ?",@rowid).all(:order=> 'profiles.name') || []
    
      return @profiles1
    end
end

