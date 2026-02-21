class BadgePreview < Lookbook::Preview
  # @label Blue
  def blue
    render "shared/badge", text: "Blue", color: :blue
  end

  # @label Green
  def green
    render "shared/badge", text: "Green", color: :green
  end

  # @label Red
  def red
    render "shared/badge", text: "Red", color: :red
  end

  # @label Yellow
  def yellow
    render "shared/badge", text: "Yellow", color: :yellow
  end

  # @label Gray
  def gray
    render "shared/badge", text: "Gray", color: :gray
  end

  # @label Purple
  def purple
    render "shared/badge", text: "Purple", color: :purple
  end

  # @label Pill
  def pill
    render "shared/badge", text: "Pill Badge", color: :blue, rounded: true
  end
end
