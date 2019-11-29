module QuestionnaireImages
  def self.build(params, object)
    attr = params[object.class.to_s.underscore][:questionnaire_images_attributes]
    key = nil
    new_params = attr.select { |k, v| key = k if v[:image].present? }
    images = []

    return if new_params.blank? || new_params[key][:image].blank?
    new_params[key][:image].split(',').flatten.each do |img|
      images << { imgable_type: new_params[key][:imgable_type], imgable_id: object.id, image: img }
    end
    object.questionnaire_images.create!(images)
  end
end
