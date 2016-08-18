class UserMailer < ApplicationMailer
  default from: 'noreply@intellectit.by'

  def send_to_subscribers(subscriber, news)
    @subscriber = subscriber
    @one = news
    mail(to: @subscriber.email, subject: 'Свежая новость')
  end
end
