class AvatarPreview < Lookbook::Preview
  # @label Small
  def small
    render "shared/avatar", name: "Jane Doe", size: :sm
  end

  # @label Medium
  def medium
    render "shared/avatar", name: "Jane Doe", size: :md
  end

  # @label Large
  def large
    render "shared/avatar", name: "Jane Doe", size: :lg
  end

  # @label With Image
  def with_image
    render "shared/avatar", name: "Jane Doe", image_url: "https://i.pravatar.cc/150?img=32", size: :lg
  end
end
