class PassengerMailer < ApplicationMailer
  default from: 'flightbooker@example.com'

    def thank_you_email(user)
        @user = user
        mail(to: @user.email, subject: 'Thank you for booking with us!')
    end
end
