namespace :radiant do
  namespace :extensions do
    namespace :testimonials do
      
      desc "Runs the migration of the Testimonials extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          TestimonialsExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          TestimonialsExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Testimonials to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        Dir[TestimonialsExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(TestimonialsExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
