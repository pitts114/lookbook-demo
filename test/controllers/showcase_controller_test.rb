require "test_helper"

class ShowcaseControllerTest < ActionDispatch::IntegrationTest
  test "homepage returns 200" do
    get root_path
    assert_response :success
  end

  test "kitchen sink returns 200" do
    get showcase_kitchen_sink_path
    assert_response :success
  end

  # Homepage content assertions
  test "homepage renders navbar" do
    get root_path
    assert_select "nav"
    assert_select "a", text: "PartialKit"
  end

  test "homepage renders hero buttons" do
    get root_path
    assert_select "a", text: "Kitchen Sink"
    assert_select "button", text: "View Source"
  end

  test "homepage renders feature cards" do
    get root_path
    assert_select "h3", text: "Props = Locals"
    assert_select "h3", text: "Children = Blocks"
    assert_select "h3", text: "Composition"
  end

  test "homepage renders alerts" do
    get root_path
    assert_select "[role=alert]", minimum: 2
  end

  test "homepage renders spinners" do
    get root_path
    assert_select "svg[role=status]", minimum: 3
  end

  test "homepage renders modal markup" do
    get root_path
    assert_select "#demo-modal"
    assert_select "h3", text: "Welcome!"
  end

  test "homepage renders empty state" do
    get root_path
    assert_select "h3", text: "No projects yet"
  end

  # Kitchen sink content assertions
  test "kitchen sink renders all button variants" do
    get showcase_kitchen_sink_path
    %w[Primary Secondary Success Warning Danger Info Ghost].each do |variant|
      assert_select "button", text: variant
    end
  end

  test "kitchen sink renders all button sizes" do
    get showcase_kitchen_sink_path
    %w[sm md lg].each do |size|
      assert_select "button", text: "Size #{size}"
    end
  end

  test "kitchen sink renders disabled buttons" do
    get showcase_kitchen_sink_path
    assert_select "button[disabled]", minimum: 2
  end

  test "kitchen sink renders link buttons" do
    get showcase_kitchen_sink_path
    assert_select "a", text: "Link Primary"
    assert_select "a", text: "Link Ghost"
  end

  test "kitchen sink renders all badge colors" do
    get showcase_kitchen_sink_path
    %w[Blue Green Red Yellow Gray Purple].each do |color|
      assert_select "span", text: color, minimum: 1
    end
  end

  test "kitchen sink renders all alert types" do
    get showcase_kitchen_sink_path
    assert_select "[role=alert]", minimum: 4
  end

  test "kitchen sink renders avatars" do
    get showcase_kitchen_sink_path
    assert_select "span", text: "AB"  # initials for Alice Bob
    assert_select "img[src*='pravatar']", minimum: 1
  end

  test "kitchen sink renders spinners" do
    get showcase_kitchen_sink_path
    assert_select "svg[role=status]", minimum: 3
  end

  test "kitchen sink renders cards" do
    get showcase_kitchen_sink_path
    assert_select "h3", text: "Card with Title"
    assert_select "img[src*='unsplash']"
  end

  test "kitchen sink renders modals" do
    get showcase_kitchen_sink_path
    assert_select "#modal-sm"
    assert_select "#modal-md"
    assert_select "#modal-lg"
  end

  test "kitchen sink renders card grids" do
    get showcase_kitchen_sink_path
    assert_select ".grid", minimum: 2
  end

  test "kitchen sink renders button groups" do
    get showcase_kitchen_sink_path
    assert_select "button", text: "Save"
    assert_select "button", text: "Cancel"
    assert_select "button", text: "Delete"
  end

  test "kitchen sink renders empty states" do
    get showcase_kitchen_sink_path
    assert_select "h3", text: "No results"
    assert_select "h3", text: "No messages"
  end

  test "kitchen sink renders inline navbar example" do
    get showcase_kitchen_sink_path
    assert_select "a", text: "ExampleApp"
  end
end
