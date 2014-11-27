class Profile < ActiveRecord::Base
  has_many :pkeywords
  belongs_to :user
  attr_accessible :user_id, :name, :description, :phone, :email, :title, :website

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

  def self.format_phone(number)
    phone_num = "("
    j=0;
    number.split('').each do |num|
      if j < 2
        phone_num = phone_num + num
      elsif j == 2
        phone_num = phone_num + num + ') - '
      elsif j < 5
        phone_num = phone_num + num
      elsif j == 5
        phone_num = phone_num + num + ' - '
      else
        phone_num = phone_num + num
      end
      j = j+1
    end

    return phone_num
  end
end

