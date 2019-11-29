module DeleteCropperImage
  def delete_image?(parameter, object)
    if parameter == 'destroy'
      object.remove_image!
      object.save
    end
  end

  def delete_main_image?(parameter, object)
    if parameter == 'destroy'
      object.remove_main_image!
      object.save
    end
  end
end
