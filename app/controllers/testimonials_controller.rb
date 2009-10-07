class TestimonialsController < ApplicationController
  
  no_login_required
  
  def index
    @testimonials = Testimonial.find(:all, :order => "RAND()", :limit => 1)

    respond_to do |format|
      format.html
      #format.xml  { render :xml => @testimonials }
    end
  end
  
end
