# Yard
Project Management System that applies the Scrum process

### Code Conventions
- Stick to Ruby and [Ruby on Rails](https://github.com/bbatsov/rails-style-guide) Code conventions.
- Use expressive variable names e.g.
don't do this:
```
  @articles.each do |c|
    <%= c.title %>
  end
```

instead use:

```
  @articles.each do |article|
  <%= article.title %>
  end
```
- Only ONE empty line between each method.
- Indent with tabs of length TWO.
- No Empty lines at the beginning of the file.
