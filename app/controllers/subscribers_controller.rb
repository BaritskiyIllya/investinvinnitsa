class SubscribersController < ApplicationController
  def create
    partial = 'successful'
    subscriber = Subscriber.find_or_initialize_by(email: subscriber_params[:email]) do |sub|
      sub.token = SecureRandom.hex(10)
    end

    if subscriber.new_record?
      partial = 'unsuccessful' unless subscriber.save
    elsif subscriber.active.eql?(true)
      partial = 'already'
    else
      partial = 'unsuccessful' unless subscriber.update(active: true)
    end

    render "subscribers/#{partial}"
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end
