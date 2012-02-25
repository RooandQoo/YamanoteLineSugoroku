class Team < ActiveRecord::Base
  def self.authenticate(name, password)
    where(:name => name, :password => Digest::SHA1.hexdigest(password.to_s)).first
  end
end
