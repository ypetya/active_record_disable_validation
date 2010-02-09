# DisableActivercordValidation
module CanDisableValidation

  @validation_disabled = nil

  def validation_disabled?
    @validation_disabled
  end

  def validation_enabled?
    !@validation_disabled
  end

  def disable_validation!
    @validation_disabled = true
  end

  def enable_validation!
    @validation_enabled = false
  end
end
