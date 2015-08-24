Deface::Override.new( 
  :name => "ambassador_tab", 
  :virtual_path => "spree/layouts/admin", 
  :insert_bottom => "[data-hook='admin_tabs']", 
  :text => "<ul class='nav nav-sidebar'>
              <%= tab 'ambassadors', url: '/admin/ambassadors', icon: 'tower', label: 'Ambassadors Page' %>
            </ul>"
)
