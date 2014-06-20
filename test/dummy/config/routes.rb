Dummy::Application.routes.draw do
  post '/tinymce_documents' => 'tinymce_documents#create'
  
  root to: 'application#editor'
end
