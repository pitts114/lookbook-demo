class ButtonPreview < Lookbook::Preview
  # @label Default
  def default
    render "shared/button", label: "Button"
  end

  # @label Primary
  def primary
    render "shared/button", label: "Primary", variant: :primary
  end

  # @label Secondary
  def secondary
    render "shared/button", label: "Secondary", variant: :secondary
  end

  # @label Success
  def success
    render "shared/button", label: "Success", variant: :success
  end

  # @label Warning
  def warning
    render "shared/button", label: "Warning", variant: :warning
  end

  # @label Danger
  def danger
    render "shared/button", label: "Danger", variant: :danger
  end

  # @label Info
  def info
    render "shared/button", label: "Info", variant: :info
  end

  # @label Ghost
  def ghost
    render "shared/button", label: "Ghost", variant: :ghost
  end

  # @label Small
  def small
    render "shared/button", label: "Small", size: :sm
  end

  # @label Medium
  def medium
    render "shared/button", label: "Medium", size: :md
  end

  # @label Large
  def large
    render "shared/button", label: "Large", size: :lg
  end

  # @label Disabled
  def disabled
    render "shared/button", label: "Disabled", disabled: true
  end

  # @label Link Button
  def link_button
    render "shared/button", label: "Visit Site", url: "#"
  end

  # @label Full Width
  def full_width
    render "shared/button", label: "Full Width", full_width: true
  end
end
