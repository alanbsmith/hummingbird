class User < ActiveRecord::Base
  has_many :user_projects
  has_many :projects, through: :user_projects


    def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider    = auth.provider
      user.uid         = auth.uid
      user.name        = auth.info.name
      user.email       = auth.info.email
      user.image       = auth.info.image
      user.save
    end
  end
end
