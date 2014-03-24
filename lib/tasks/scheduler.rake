desc "This task is called by the Heroku scheduler add-on"
task :create_expired_credit_lines => :environment do
  puts "Creating expired credit lines..."
  CreditsController.create_expired_lines
  puts "done."
end

task :email_reminder_credits_expiring_soon => :environment do
  puts "Sending emails to users where credits expire soon..."
  MailsController.credits_expiring_soon
  puts "done."
end


