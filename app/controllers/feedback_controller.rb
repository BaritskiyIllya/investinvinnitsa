class FeedbackController < ApplicationController
  def send_feedback
    @feedback = Feedback.new(feedback_params)
    if @feedback.valid?
      FeedbackMailer.call_mailer(feedback_params).deliver
      respond_to do |format|
        format.js {}
      end
    else
      respond_to do |format|
        format.js { render status: :unprocessable_entity }
      end
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :phone, :email, :description, :file)
  end
end
