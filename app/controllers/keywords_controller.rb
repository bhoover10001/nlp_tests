class KeywordsController < ApplicationController
  def create
    @document = Document.find(params[:document_id])
    @keyword = @document.keywords.create(keyword_params)
    redirect_to document_path(@document)
  end
  
  private
    def keyword_params
      params.require(:keyword).permit(:keyword)
    end
end
