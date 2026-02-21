class SpinnerPreview < Lookbook::Preview
  # @label Small
  def small
    render "shared/spinner", size: :sm
  end

  # @label Medium
  def medium
    render "shared/spinner", size: :md
  end

  # @label Large
  def large
    render "shared/spinner", size: :lg
  end

  # @label Blue
  def blue
    render "shared/spinner", color: :blue
  end

  # @label White
  def white
    render "shared/spinner", color: :white
  end

  # @label Gray
  def gray
    render "shared/spinner", color: :gray
  end
end
