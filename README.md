Overview
========

Template.js is a app that bring templating to Javascript apps. Supposed we have the following snippit in `simple.js`:

    ...
    str = TEMPLATE("simple.html.te", {a : 1})
    ...
    
and `simple.html.te` has:
    
    <b><% a %></b>
  
When we run `./template.py simple.js`, the output would be:

    ...
    str = "<b>1</b>"
    ...
    
Features
========

Template.js also supports `if` and `for` statements. Here are some examples:

    <% for color in arr %>
      <b><% color %></b>
    <% end %>
    
    <% if a %>
      <% a %>
    <% else if c %>
      <% b %>
    <% end %>
