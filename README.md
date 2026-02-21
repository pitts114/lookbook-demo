# PartialKit — ERB Partials as Components

A Rails demo app showing that ERB partials can serve the same role as a React component library — reusable, composable, and testable. No extra gems, just Rails built-ins.

If you're a React developer exploring Rails, this project maps familiar concepts:

| React | Rails ERB |
|-------|-----------|
| `<Button variant="danger" size="lg">` | `render "shared/button", variant: :danger, size: :lg` |
| `{children}` | `<%= yield %>` |
| `{children && <div>...}` | `if block_given?` |
| `<CardGrid><Card /></CardGrid>` | Nesting `render` calls with blocks |
| Props with defaults | Locals with `\|\|=` |

## Pages

- **`/`** — A polished homepage composing partials into a realistic layout
- **`/showcase/kitchen_sink`** — Every partial in every variant (the "Storybook" page)
- **`/lookbook`** — Interactive component browser powered by [Lookbook](https://lookbook.build) (development only)

## How a Partial Works

Here's the button partial (`app/views/shared/_button.html.erb`) — it takes locals like props and maps variant/size combinations to Tailwind classes:

```erb
<%
  # Props with defaults
  label    ||= "Button"
  variant  ||= :primary
  size     ||= :md
  url      ||= nil
  disabled ||= false
  full_width ||= false

  base = "inline-flex items-center justify-center font-medium rounded-lg transition-colors focus:outline-none focus:ring-2 focus:ring-offset-2"

  sizes = {
    sm: "px-3 py-1.5 text-sm",
    md: "px-4 py-2 text-sm",
    lg: "px-6 py-3 text-base"
  }

  variants = {
    primary:   "bg-blue-600 text-white hover:bg-blue-700 focus:ring-blue-500",
    secondary: "bg-gray-200 text-gray-800 hover:bg-gray-300 focus:ring-gray-500",
    success:   "bg-green-600 text-white hover:bg-green-700 focus:ring-green-500",
    warning:   "bg-yellow-500 text-white hover:bg-yellow-600 focus:ring-yellow-500",
    danger:    "bg-red-600 text-white hover:bg-red-700 focus:ring-red-500",
    info:      "bg-cyan-500 text-white hover:bg-cyan-600 focus:ring-cyan-500",
    ghost:     "bg-transparent text-gray-700 hover:bg-gray-100 focus:ring-gray-500"
  }

  classes = [base, sizes[size.to_sym], variants[variant.to_sym]]
  classes << "w-full" if full_width
  classes << "opacity-50 cursor-not-allowed" if disabled
%>

<% if url && !disabled %>
  <%= link_to label, url, class: classes.join(" ") %>
<% else %>
  <button class="<%= classes.join(" ") %>" <%= "disabled" if disabled %>><%= label %></button>
<% end %>
```

Then you use it anywhere with `render`:

```erb
<%# Simple button %>
<%= render "shared/button", label: "Save", variant: :primary %>

<%# Link button %>
<%= render "shared/button", label: "Learn More", variant: :ghost, url: "/about" %>

<%# Disabled large danger button %>
<%= render "shared/button", label: "Delete", variant: :danger, size: :lg, disabled: true %>
```

Container partials accept blocks, just like React children:

```erb
<%# Card wrapping content — yield is {children} %>
<%= render "shared/card", title: "My Card" do %>
  <p>This is the card body.</p>
  <%= render "shared/badge", text: "New", color: :green %>
<% end %>

<%# Composing partials: a grid of cards %>
<%= render "shared/card_grid", columns: 3 do %>
  <%= render "shared/card", title: "First" do %>...content...<% end %>
  <%= render "shared/card", title: "Second" do %>...content...<% end %>
  <%= render "shared/card", title: "Third" do %>...content...<% end %>
<% end %>
```

## Partials Reference

| Partial | Type | Key Locals |
|---------|------|-----------|
| `_button` | Leaf | `label`, `variant`, `size`, `url`, `disabled`, `full_width` |
| `_badge` | Leaf | `text`, `color`, `rounded` |
| `_spinner` | Leaf | `size`, `color` |
| `_avatar` | Leaf | `name`, `image_url`, `size` |
| `_alert` | Leaf | `message`, `type`, `dismissible` + optional block |
| `_card` | Container | `title`, `subtitle`, `image_url`, `padding` + block |
| `_section` | Container | `title`, `subtitle`, `background`, `max_width` + block |
| `_modal` | Container | `id`, `title`, `size` + block |
| `_navbar` | Container | `brand`, `links` + block (right-side slot) |
| `_empty_state` | Container | `title`, `description`, `icon` + optional block |
| `_card_grid` | Composition | `columns` + block |
| `_button_group` | Composition | `direction` + block |

## Setup

```bash
git clone <repo-url>
cd lookbook-demo
bundle install
```

## Run

```bash
bin/rails server
```

Then visit [http://localhost:3000](http://localhost:3000).

For live Tailwind recompilation during development:

```bash
bin/rails tailwindcss:watch
```

## Tests

```bash
bin/rails test
```

23 request tests verify both pages render correctly with all component variants.

## Lookbook

[Lookbook](https://lookbook.build) provides an interactive UI for browsing partials in isolation — like Storybook but native to Rails. It works with plain ERB partials (no ViewComponent required).

Preview classes live in `test/components/previews/` with one file per partial. Partials that accept blocks use companion ERB templates in subdirectories (e.g. `card_preview/with_title.html.erb`).

Lookbook is available in development at [http://localhost:3000/lookbook](http://localhost:3000/lookbook).

## Stack

- Ruby on Rails 8.1
- Tailwind CSS 4
- Stimulus (ships with Rails) — used for modal open/close and alert dismiss
- [Lookbook](https://lookbook.build) — component preview browser (development only)
