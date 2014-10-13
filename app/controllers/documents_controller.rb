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

  def edit
    @document = Document.find(params[:id])
  end
  
  def update
    @document = Document.find(params[:id])
    if @document.update(document_params)
      redirect_to @document
    else
      render 'edit'
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    
    redirect_to documents_path
  end

  private
    def document_params
      params.require(:document).permit(:title, :text)
    end
end
