class TopicsController < ApplicationController
  def create
    @document = Document.find(params[:document_id])
    @topic = @document.topics.create(topic_params)
    redirect_to document_path(@document)
  end
  
  private
    def topic_params
      params.require(:topic).permit(:topic)
    end

end
