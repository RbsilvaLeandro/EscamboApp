class AdminMailerPreview < ActionMailer::Preview	
	def update_mail()
		AdminMailer.update_mail(Admin.first, Admin.last)
	end
end