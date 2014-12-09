class Profile < ActiveRecord::Base
  has_many :pkeywords
  belongs_to :user

  attr_accessible :user_id, :name, :description, :phone, :email, :title, :website, :pic
  has_attached_file :pic, :styles => { :medium => "300x300>", :thumb => "110x100>" }, :default_url => "/assets/default.png"
  validates_attachment_content_type :pic, :content_type => /\Aimage\/.*\Z/

  validates :name, format: { with: /\s*\w+\s*?\w+?\s*?\w+/,
     message: "name should be atleast 3 characters long" }
  validates :description, format: { with: /\s*\w+\s*?\w+?\s*?\w+/,
     message: "bio should be atleast 3 characters long" }

  validates :phone, format: { with: /^\d{10}$/,
    message: "Phone number is not of the correct format" }

  validates :website, format: { with: /^$|^http(s?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/,
    message: "Website URL is not of the correct format" }

  validates :email, format: { with: /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/,
    message: "Email is not of the correct format" }

  validates_attachment :pic,
     :less_than => 1.megabytes, :message => "Photo has to be a jpeg image of size < 1 MB"


 @profiles = []

  def self.get_profiles_by_keyword(term)
    @row = Keyword.get_match(term)
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
      return phone_num
    else
      return ''
    end
  end
  
  def self.get_profiles_by_name(term)
    @term=term;
    
    @profiles1 = []
    
          @row1 = Status.where('status.code = ?', 'ACTIVE').first
          @rowid = @row1.id
          
        @profiles1= self.joins('JOIN users ON profiles.user_id = users.id').where( "profiles.name ILIKE ?",'%'+ term +'%').where(" users.status_id= ?",@rowid).all(:order=>'profiles.name') || []
        
      
    return @profiles1
  end
  
  def remove_pic
    self.pic = nil;
  end
  
  def self.get_profiles_by_desc(term)
   # @profiles=[]
    @profiles1 = []
    @profiles2 = []
    
    @row1=Status.where('status.code = ?', 'ACTIVE').first

    @rowid=@row1.id
    @profiles1=self.joins('JOIN users ON profiles.user_id = users.id').where("profiles.description ILIKE ?",'%'+ term +'%').where("users.status_id= ?",@rowid).all(:order=> 'profiles.name') || []
    
      return @profiles1
    end


end
