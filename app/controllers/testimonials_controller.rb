class TestimonialsController < ApplicationController
  
  no_login_required
  radiant_layout 'Main'
  
  def index
      @testimonial = Testimonial.find_by_sql("select * from testimonials order by rand() limit 1")
      #render :layout => false
      
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @testimonials }
      end
      
    end
      
  def show
    @testimonial = Testimonial.find(params[:id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @testimonials }
    end
  end
  
  def image
    @testimonial = Testimonial.find(params[:id])
    render :layout => false
  end
  
end
