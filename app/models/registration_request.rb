class RegistrationRequest < ActiveRecord::Base
	before_create :set_request_uid
	
	private
	def set_request_uid
		last_val = RegistrationRequest.maximum(:request_uid)
		self.request_uid = last_val.to_i + 1
	end
end
