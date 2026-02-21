class AlertPreview < Lookbook::Preview
  # @label Info
  def info
    render "shared/alert", message: "This is an informational message.", type: :info
  end

  # @label Success
  def success
    render "shared/alert", message: "Operation completed successfully!", type: :success
  end

  # @label Warning
  def warning
    render "shared/alert", message: "Please review before continuing.", type: :warning
  end

  # @label Danger
  def danger
    render "shared/alert", message: "Something went wrong.", type: :danger
  end

  # @label Dismissible
  def dismissible
    render "shared/alert", message: "You can dismiss this alert.", type: :info, dismissible: true
  end

  # @label With Action
  def with_action
    render_with_template
  end
end
