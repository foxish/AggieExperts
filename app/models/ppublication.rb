class Ppublication < ActiveRecord::Base
  attr_accessible :user_id, :url, :title
  belongs_to :user
  validates :title, format: { with: /\w+\s*?\w+?\s*?\w+/, message: "title should be atleast 3 characters long"}
  validates :url, format: { with: /^$|^http(s?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/,
                            message: "Publication URL is not of the correct format" }

  def self.update(params)
    errors = ""
    self.where(:user_id => params[:id]).each do |pub|
      if params[:data].key?(pub.id.to_s) && params[:data][pub.id.to_s].key?("check")
        pub.destroy
      else
        pub.update_attributes((params[:data][pub.id.to_s])['data'])
        errors = errors == ''?
            pub.errors.messages.values.join(' + ') :
            errors + " + " + pub.errors.messages.values.join(' + ')
        puts errors
      end
      # error = error + pub.errors.values.join(' + ')
    end

    if params[:data].key?("new")
      params[:data]['new'].each do |key, pub|
        unless pub['data']['title'] == '' && pub['data']['url'] == ''
          pub = Ppublication.new(:user_id => params[:id], :title => pub['data']['title'], :url => pub['data']['url'])
          if pub.valid?
            pub.save
          else
            errors = errors == ''?
                pub.errors.messages.values.join(' + ') :
                errors + " + " + pub.errors.messages.values.join(' + ')
          end
        end
      end
    end

    return errors
  end
end
