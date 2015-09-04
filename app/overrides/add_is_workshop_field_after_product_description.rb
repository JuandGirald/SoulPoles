Deface::Override.new(
  :virtual_path => 'spree/admin/products/_form',
  :name => 'add_is_workshop',
  :insert_after => '[data-hook="admin_product_form_description"]',
  :text => "
    <%= f.field_container :is_workshop do %>
      <%= f.label :is_workshop, raw(Spree.t(:is_workshop)) %>
      <%= f.check_box :is_workshop,  {}, 'true', 'false' %>
      <%= f.error_message_on :is_workshop %>
    <% end %>
  "
)