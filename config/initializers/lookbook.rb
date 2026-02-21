return unless Rails.env.development?

Rails.application.config.lookbook.preview_layout = "lookbook_preview"

# Add the previews directory to view paths so Rails can resolve the layout
# from test/components/previews/layouts/ instead of app/views/layouts/
Rails.application.config.after_initialize do
  ActionController::Base.prepend_view_path Rails.root.join("test/components/previews")
end
