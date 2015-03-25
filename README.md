# Yard
The Project Management System that applies the Scrum Process.

## Long Live the Process

### How to contribute
- Create a New Branch.
- Create an Issue for your task.
- Use Labels.
- Write tests.
- Do NOT push before testing that your code works.
- Commit Changes with the Issue Number in the commit message e.g.
```
  git commit -m "resolved listing projects #15"
```
- Create a Pull Request.

### Documentation
- Write comments on methods when you think it's needed
- use the form:
  ```
  # YOUR NAME
  # DESCRIBE YOUR METHOD BRIEFLY
  def method_name
  ...
  end
  ```

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
