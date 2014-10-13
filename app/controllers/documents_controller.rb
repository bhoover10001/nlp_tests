class DocumentsController < ApplicationController
  def new
  end
  
  def create
    @document = Document.new(document_params)
    
    @document.save
    redirect_to @document
  end
  
  def show
    @document = Document.find(params[:id])
  end
  
  def index
    @documents = Document.all
  end
  private
    def document_params
      params.require(:document).permit(:title, :text)
    end
end
