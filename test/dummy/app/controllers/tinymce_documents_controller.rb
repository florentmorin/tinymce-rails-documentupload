class TinymceDocumentsController < ApplicationController
  respond_to :json

  def create
    document = Document.create params.permit(:file)
    
    url = "#{request.protocol}#{request.host_with_port}#{document.file.url}"

    render json: {
      document: {
        url:    url
      }
    }, layout: false, content_type: "text/html"
  end
end
