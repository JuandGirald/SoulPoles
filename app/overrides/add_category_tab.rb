Deface::Override.new( 
  :name => "categories_content_tab", 
  :virtual_path => "spree/layouts/admin", 
  :insert_bottom => "[data-hook='admin_tabs']", 
  :text => "<ul class='nav nav-sidebar'>
            <%= tab 'category content', url: '/admin/categories', icon: 'align-center', label: 'Category Content' %>
            </ul>"
)
