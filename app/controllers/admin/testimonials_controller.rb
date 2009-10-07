class Admin::TestimonialsController < ApplicationController
  
  def index
    @testimonials = Testimonial.find(:all)
    
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @testimonial = Testimonial.find(params[:id])
    
    respond_to do |format|
      format.html
    end
  end

  def new
    @testimonial = Testimonial.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @testimonial = Testimonial.find(params[:id])
  end

  def create
    @testimonial = Testimonial.new(params[:testimonial])

    respond_to do |format|
      if @testimonial.save
        flash[:notice] = 'Testimonial was successfully created.'
        format.html { redirect_to('/admin/testimonials') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @testimonial = Testimonial.find(params[:id])

    respond_to do |format|
      if @testimonial.update_attributes(params[:testimonial])
        flash[:notice] = 'Testimonial was successfully updated.'
        format.html { redirect_to('/admin/testimonials') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @testimonial = Testimonial.find(params[:id])
    @testimonial.destroy

    respond_to do |format|
      flash[:notice] = 'Testimonial was successfully deleted.'
      format.html { redirect_to('/admin/testimonials') }
    end
  end
  
end