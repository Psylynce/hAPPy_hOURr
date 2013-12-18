class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_create :create_remember_token
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, 
				format: { with: VALID_EMAIL },
				uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 6 }
	has_many :comments

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	has_many :evaluations, class_name: "RSEvaluation", as: :source

	has_reputation :ratings, source: {reputation: :ratings, of: :bars}, aggregated_by: :sum

	def voted_for?(bar)
	  evaluations.where(target_type: bar.class, target_id: bar.id).present?
	end

	private

		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end
end

