class User < ActiveRecord::Base
  has_many :addresses

  def self.login(username, password)
    where(name: username, password: password).first
  end
end
