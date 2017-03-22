class User < ActiveRecord::Base
  validates :first_name, :last_name, :email, :location, :state, :presence => true
  validates :email, :uniqueness => true

  def verify password
    return self.password == password
  end

end
