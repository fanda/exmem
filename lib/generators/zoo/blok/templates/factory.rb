Factory.define :<%= singular_name %> do |<%= singular_name %>|
  <%- for attribute in model_attributes -%>
  <%= singular_name %>.<%= attribute.name %> <%= attribute.default %>
  <%- end -%>
end