class Account < ActiveRecord::Base
	belongs_to :user
	has_many :categories
  	default_scope -> { order('created_at DESC') }
  	validates :username, presence: true
  	validates :password, presence: true
  	validates :host, presence: true
  	validates :user_id, presence: true
end
