# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class TestimonialsExtension < Radiant::Extension
  version "1.0"
  description "A Radiant extension that allows you to add testimonials and generate them randomly on each page"
  url "http://www.scullytown.com"
  
  define_routes do |map|
    
    #This links to an xml file listing of all the testimonials, defined in the extension tags
    #map.connect 'testimonials', :url => '/testimonials', :controller => "site", :action => "show_page"
   # map.connect '', :controller => "testimonials", :action => "index"
    
    map.resources :testimonials
    
    map.with_options(:controller => 'admin/testimonials') do |testimonial|
      testimonial.testimonial_index           'admin/testimonials',             :action => 'index'
      testimonial.testimonial_show            'admin/testimonials/show/:id',    :action => 'show'   
      testimonial.testimonial_new             'admin/testimonials/new',         :action => 'new'
      testimonial.testimonial_create          'admin/testimonials/create',      :action => 'create'   
      testimonial.testimonial_edit            'admin/testimonials/edit/:id',    :action => 'edit'
      testimonial.testimonial_update          'admin/testimonials/update/:id',  :action => 'update'
      testimonial.testimonial_remove          'admin/testimonials/remove/:id',  :action => 'destroy'
    end

  end
  
  def activate
    admin.tabs.add "Testimonials", "/admin/testimonials", :after => "Layouts", :visibility => [:all]
    Page.send :include, TestimonialTags
    NoCachePage
  end
  
  def deactivate
    # admin.tabs.remove "Testimonial"
  end
  
end