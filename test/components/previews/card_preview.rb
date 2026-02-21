class CardPreview < Lookbook::Preview
  # @label With Title
  def with_title
    render_with_template
  end

  # @label With Image
  def with_image
    render_with_template
  end

  # @label Body Only
  def body_only
    render_with_template
  end
end
