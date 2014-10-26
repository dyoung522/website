class User < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :email

  def firstname
    name.split[0]
  end

  def lastname
    name.split[-1]
  end

  def middlename
    name.split[1...-1].join(' ')
  end
end
