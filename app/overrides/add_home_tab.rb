Deface::Override.new( :name => "home_tab", 
                      :virtual_path => "spree/layouts/admin", 
                      :insert_bottom => "[data-hook='admin_tabs']", 
                      :text => "<ul class='nav nav-sidebar'>
                                  <%= tab 'home', url: '/admin/home', icon: 'home', label: 'Home Page' %>
                                </ul>"
                    )
