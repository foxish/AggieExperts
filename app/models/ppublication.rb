class Ppublication < ActiveRecord::Base
  attr_accessible :user_id, :url, :title
  belongs_to :user
  validates :title, presence: true

  def self.update(params)
    self.where(:user_id => params[:id]).each do |pub|
      if ((params[:data][pub.id.to_s]).key?("check"))
        pub.destroy
      else
        pub.update_attributes!((params[:data][pub.id.to_s])['data'])
      end
    end

    params[:data]['new'].each do |key, pub|
      self.create(:user_id => params[:id], :title => pub['data']['title'], :url => pub['data']['url'])
    end
  end
end
