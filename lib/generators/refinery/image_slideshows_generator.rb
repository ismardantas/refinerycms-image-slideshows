module Refinery
  class ImageSlideshowsGenerator < Rails::Generators::Base

    def rake_db
      rake("refinery_image_slideshows:install:migrations")
    end

    def append_load_seed_data
      create_file 'db/seeds.rb' unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))
      append_file 'db/seeds.rb', :verbose => true do
        <<-EOH

# Added by Refinery CMS Image Slideshows extension
Refinery::ImageSlideshows::Engine.load_seed
        EOH
      end
    end
  end
end