Deface::Override.new( 
  :name => "warranty_tab", 
  :virtual_path => "spree/layouts/admin", 
  :insert_bottom => "[data-hook='admin_tabs']", 
  :text => "<ul class='nav nav-sidebar'>
              <%= tab 'warranty_requests', url: '/admin/warranties', icon: 'retweet', label: 'Warranty Requests' %>
            </ul>"
)
