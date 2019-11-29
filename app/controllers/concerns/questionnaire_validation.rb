module QuestionnaireValidation
  def status_valid?(status)
    Questionnaire.states_with_except.detect { |item| item == status }.present?
  end
end
