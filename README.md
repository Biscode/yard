# Yard
The Project Management System that applies the Scrum Process.

### Code Conventions
- Stick to [Ruby on Rails](https://github.com/bbatsov/rails-style-guide) Code conventions.
- Use expressive method and variable names e.g.
don't do this:
```
  <% @articles.each do |c| %>
    <h2><%= c.title %></h2>
  <% end %>
```

instead use:

```
  <% @articles.each do |article| %>
    <h2><%= article.title %></h2>
  <% end %>
```
- Only ONE empty line between each method.
- Indent with tabs of length TWO.
- No Empty lines at the beginning of the file.
