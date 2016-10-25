class UserStore < ActiveRecord::Base
  belongs_to :source
  belongs_to :environment
  belongs_to :identity_type
  has_many :user_source_links
  has_many :user_store_roles

end
