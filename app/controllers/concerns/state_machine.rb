module StateMachine
  def draft
    instance.reject!
  end

  def published
    instance.publishing!
  end

  def archived
    instance.archiving!
  end

  def unverified
    instance.moderation!
  end
end
