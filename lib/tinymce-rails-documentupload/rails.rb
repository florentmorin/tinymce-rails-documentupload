module Tinymce
  module Rails
    module Documentupload
      class Engine < ::Rails::Engine
        initializer 'TinymceRailsDocumentupload.assets_pipeline' do |app|
          app.config.assets.precompile << "tinymce/plugins/uploaddocument/*"
        end
      end
    end
  end
end