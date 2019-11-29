class FeedbackMailer < ApplicationMailer
  def call_mailer(feedback)
    @feedback = feedback
    at_f = File.absolute_path(@feedback[:file].tempfile) if @feedback[:file].present? && @feedback[:file] != 'undefined'
    attach = File.read(at_f) if at_f
    attachments[@feedback[:file].original_filename] = attach if attach
    mail(to: ENV['DELIVER_TO'], subject: 'Новий запит на зворотній зв\'язок')
  end

  def send_land_area_mail(form)
    @form = form
    mail(to: ENV['DELIVER_TO'], subject: 'Нова форма земельної ділянки')
  end

  def send_potential_investor_mail(form)
    @form = form
    file = @form.representative.additional if @form.representative && @form.representative.additional.present?
    attach = File.read(file.file.path) if file
    attachments[file.file.original_filename] = attach if attach
    mail(to: ENV['DELIVER_TO'], subject: 'Нова форма потенційного інвестора')
  end

  def send_submission_project_mail(form)
    @form = form
    mail(to: ENV['DELIVER_TO'], subject: 'Нова форма інвестиційного проекту')
  end
end
