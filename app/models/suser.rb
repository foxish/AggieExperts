require 'securerandom'
require 'mailgun'

class Suser < ActiveRecord::Base
   attr_accessible :email, :activation_link, :active_till
   validates :email, presence: true,uniqueness: {:message => "already exist"}
   validates :activation_link, uniqueness: true

   def self.insert_suser(email)
   	random_token = SecureRandom.hex(50)
   	suser = Suser.create!(:email => email,:activation_link => random_token, :active_till => Time.now+10.days)
      suser.sendActivationLink
   	random_token[10]
   end

   def sendActivationLink
      mg_client = Mailgun::Client.new "key-039e5cae20d25dcfcfbbc191df4d99c6"
      http_activation_link = "http://localhost:3000/activate?aid="+self.activation_link
      body = "<html><div style='color:#000000'>You have been invited to join to AggieExperts!!<br><br>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.<br/><br/>To complete your registration <a href="+http_activation_link+">click here</a>.<br>
    <br>
    Or<br>
    <br>
    Copy and past this link in the browser<br>
    <br>"+
    http_activation_link+"<br>
    <br>
    --<br>
    Admin<br>
    Aggie Experts
  </div>
</html>"
      message_params = {:from    => 'no_reply_aggieexperts@tamu.edu',  
                        :to      => self.email,
                        :subject => 'Welcome To AggieExperts!',
                        :html    => body}
      mg_client.send_message "sandboxc665c980e8404ecf8d9f037580207b14.mailgun.org", message_params
   end

   def re_send_act
      email = self.email
      Suser.destroy(self.id)
      Suser.insert_suser(email)
   end
    
end
