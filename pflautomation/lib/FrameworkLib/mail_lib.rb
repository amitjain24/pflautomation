=begin
/* 
* Copyright (c) 2018-2019 PFL. All rights reserved.
*/
=end

require './lib/FrameworkLib/utility_lib.rb'
require './lib/FrameworkLib/global_lib.rb'

	module MAIL
	require 'mail'
	options = { :address              => "smtp.gmail.com",
				:port                 => 587,
				:domain               => 'mail.google.com',
				:user_name            => "#{USER_MAIL}",
				:password             => "#{USER_PASSWORD}",
				:authentication       => 'plain',
				:enable_starttls_auto => true
	}
	Mail.defaults do
		delivery_method :smtp, options
	end

	# this method sends email to mentioned users in your configuration with attaching the result/report
	# @param mailTo String = this is the list of receipient(in form of email id), receipients could be multiple
	# @mailFrom String = this is sender's email id
	# @mailSubject String = this is subject of the mail, being sent to receipients
	# @mailBody String = this is the content of the email
	# @mailAttachfile html/txt = this is attached report/file in mail
	def MAIL.sendmail mailTo, mailFrom, mailSubject, mailBody, mailAttachfile
		Mail.deliver do
			to mailTo
			from mailFrom
			subject mailSubject
			body mailBody
			Dir.glob('Test*.{html,txt,log}') do |file|
			add_file file
		end
	end
	end
end
