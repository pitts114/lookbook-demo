class EmptyStatePreview < Lookbook::Preview
  # @label Default
  def default
    render "shared/empty_state", title: "Nothing here yet"
  end

  # @label With Icon
  def with_icon
    render "shared/empty_state", title: "No results found", description: "Try adjusting your search or filters.", icon: "🔍"
  end

  # @label With CTA
  def with_cta
    render_with_template
  end
end
