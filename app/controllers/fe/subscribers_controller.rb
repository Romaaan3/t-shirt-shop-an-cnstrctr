class Fe::SubscribersController < ApplicationController
  def create
    sub = Subscriber.find_by(email: params[:email])
    if sub == nil
      @subscriber = Subscriber.new(subscriber_params)
      secret_name=('a'..'z').to_a.shuffle.first(8).join
      @subscriber.secret_name = secret_name
      respond_to do |format|
        if @subscriber.save
          format.html { redirect_to fe_kontakty_path, notice: 'Спасибо, что подписались на наши новости.' }
          format.js { }
        end
      end
    elsif sub != nil
      sub.active = true
      respond_to do |format|
        if sub.save
          format.html { redirect_to fe_kontakty_path, notice: 'Спасибо, что подписались на наши новости.' }
        end
      end
    elsif sub != nil && sub.active == true
      respond_to do |format|

        format.html { redirect_to fe_kontakty_path, notice: 'Вы уже подписаны' }


      end
    end
  end

  def unsubscribe

    subscriber = Subscriber.find_by(secret_name: params[:secret_name])
    if subscriber != nil
      subscriber.active = false
      if subscriber.save!
        redirect_to fe_root_url
      end
    end
  end

  private

  def subscriber_params
      params.permit(:email)
  end
end
