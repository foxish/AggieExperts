class Pkeyword < ActiveRecord::Base
  attr_accessible :user_id, :keyword_id
  #has_one :profile -- psakuru:wouldn't make sense as we dont have profile_id as a foreign key here 
  #Replacing with belongs_to :user
  belongs_to :user
  belongs_to :keyword
  validates :user_id, presence: true
  validates :keyword_id , presence: true

  def self.update(params)
    # Create new keywords if it doesn't exist
    keywords = []
    key_id = {}
    params[:data].each do |id, keys|
      if keys['key'] != ''
        k = Keyword.find_or_create_by_key(:key => keys['key'].downcase)
        k.save
        keywords.push(k.id)
        key_id[k.key] = k.id
      end
    end

    # Add these new keywords in PKeywords for a particular user
    keywords.each do |id|
      puts "foo"
      r = Pkeyword.find_or_create_by_keyword_id_and_user_id(:user_id => params[:id], :keyword_id => id)
      r.save
    end

    # Delete those keywords that have been removed by the user
    user_keys = params[:data].values.map {|k| key_id[k['key'].downcase] unless k['key'] == ''}
    self.where(:user_id => params[:id] ).each do |r|
      unless user_keys.include? r.keyword_id
        r.destroy
      end
    end

    # Delete those keywords that have been marked for delete
    params[:data].each do |id, key|
      if(key['check'])
        self.where(:user_id => params[:id], :keyword_id => key_id[key['key'].downcase]).each do |r|
          r.destroy
        end
      end
    end
  end
end
