class UserMailer < ApplicationMailer
	
	def invite_candidate(candidate)
      @candidate = candidate
      mail(to: @candidate.email, subject: 'Test Email for Letter Opener')
    end
end
