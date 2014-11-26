class Pkeyword < ActiveRecord::Base
  attr_accessible :user_id, :keyword_id
  #has_one :profile -- psakuru:wouldn't make sense as we dont have profile_id as a foreign key here 
  #Replacing with belongs_to :user
  belongs_to :user
  belongs_to :keyword
  validates :user_id, presence: true
  validates :keyword_id , presence: true

  def self.update(params)
    keywords = []
    key_id = {}
    params[:data].each do |id, keys|
      if keys['key'] != ''
        k = Keyword.find_or_create_by_key(:key => keys['key'])
        keywords.push(k.id)
        key_id[k.key] = k.id
      end
    end

    keywords.each do |id|
      Pkeyword.find_or_create_by_keyword_id(:user_id => params[:id], :keyword_id => id)
    end

    params[:data].each do |id, key|
      if(key['check'])
        self.where(:user_id => params[:id], :keyword_id => key_id[key['key']]).each do |r|
          r.destroy
        end
      end
    end

    # self.where(:user_id => params[:id]).each do |key|
    #   # if key.
    #   if ((params[:data][key.id.to_s]).key?("check"))
    #     key.destroy
    #   end
    # end
  end
end
