module TestimonialTags
  include Radiant::Taggable
  
  tag 'testimonials' do |tag|
    tag.expand
  end
          
  tag 'testimonials:each' do |tag|
    result = []
    Testimonial.find_by_sql("select * from testimonials order by rand() limit 1").each do |testimonial|
      tag.locals.testimonial = testimonial
      result << tag.expand
    end
    result
  end
 
  tag 'testimonials:each:id' do |tag|
     testimonial = tag.locals.testimonial
     %{#{testimonial.id}}
  end
     
  tag 'testimonials:each:author' do |tag|
    testimonial = tag.locals.testimonial
    %{#{testimonial.author}}
   end
  
   tag 'testimonials:each:body' do |tag|
     testimonial = tag.locals.testimonial
     %{#{testimonial.body}}
  end
  
end