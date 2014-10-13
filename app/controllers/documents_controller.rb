require 'treat'
include Treat::Core::DSL


class DocumentsController < ApplicationController
  def new
    @document = Document.new
  end
  
  def create
    @document = Document.new(document_params)
    process_url
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

  def process_url
    c = collection('collections/press_releases')
    d = document @document.url

    c << d
    c.apply(:chunk, :segment, :tokenize)
    
    processedDocument = c.documents.last
    @document.title = processedDocument.titles[0].to_s
    @document.text = processedDocument.to_s
    @document.save
    processedDocument.topics.each do |topic|
      newTopic= Topic.new({"topic" => topic.to_s, "document_id" => @document.id})
      newTopic.save
    end
    processedDocument.keywords.each do |keyword|
      newKeyword = Keyword.new({"keyword" => keyword.to_s, "document_id" => @document.id})
      newKeyword.save
    end
  end
  
  private
    def document_params
      params.require(:document).permit(:title, :text, :url)
    end
    
    def new_document_params
      params.require(:document).permit(:url)
    end
end
