class User < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :games

  def self.authenticate(name, password)
    user = User.find_by_name(name)
    if user && user.password == password
      return user
    end

    return nil
  end
end
