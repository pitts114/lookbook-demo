class NavbarPreview < Lookbook::Preview
  # @label With Links
  def with_links
    render "shared/navbar", brand: "MyApp", links: [
      { label: "Home", url: "#" },
      { label: "Features", url: "#" },
      { label: "Pricing", url: "#" }
    ]
  end

  # @label With Slot Content
  def with_slot_content
    render_with_template
  end
end
