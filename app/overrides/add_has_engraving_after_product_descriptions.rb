Deface::Override.new(
  :virtual_path => 'spree/admin/products/_form',
  :name => 'add_has_engraving',
  :insert_after => '[data-hook="admin_product_form_description"]',
  :text => "
    <%= f.field_container :has_engraving do %>
      <%= f.label :has_engraving, raw(Spree.t(:has_engraving)) %>
      <%= f.check_box :has_engraving,  {}, 'true', 'false' %>
      <%= f.error_message_on :has_engraving %>
    <% end %>
  "
)