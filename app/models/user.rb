class User < ActiveRecord::Base
  # Remember to create a migration!
  def self.authenticate(uname = "", pword = "")
    #no free ride, you pay!
    return false if uname == "" || pword == ""
    #now we encrypt it if neither are bland because it
    #would be a waste of power to do so and have it empty
    pword = Digest::MD5.hexdigest(pword)
    obj   = User.where('username = ?',uname).first
    if !obj.nil?
      obj.password == pword ? true : false
    end
  end
end
