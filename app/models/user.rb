class User < ApplicationRecord
  has_many :projects
  has_many :locations, through: :projects
  #has_many :photos, :through => :projects
  #has_many :notes, :through => :projects
  has_secure_password :validations => false


  def self.find_or_create_from_auth_hash(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.first_name = auth.info.first_name
			user.last_name = auth.info.last_name
			user.email = auth.info.email
      user.save!
  end
end
end
