class User < ActiveRecord::Base
  def self.login(username, password)
    where(name: username, password: password).first
  end
end
