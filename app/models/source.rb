class Source < ActiveRecord::Base
  has_many :cert_stores
  has_many :user_stores

end
