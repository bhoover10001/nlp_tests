require 'test_helper'

class DocumentsControllerTest < ActionController::TestCase
  test "should get index" do
    document = create(:document)
    get :index
    assert_response :success
    assert_not_nil assigns(:documents)
    assert_contains(assigns["documents"], document, "documents does not contain " + document.id.to_s)
  end
  
  test "show an id" do
    document = create(:document)
    get(:show, {'id' => document.id})
    assert_not_nil assigns(:document)
    assert_equal(assigns["document"], document)
  end
  
  # NOTE - This test is highly depenedent on the training data currently located in collections/preses_releases.
  # If any of those files change, the result will also change. Based on the training data, the current answers are deterministic.
  test "should create document" do
    document = build(:document)
    assert_difference('Document.count') do
      post :create, document: {url: document.url}
    end
    assert_equal(6, assigns[:document].keywords.length)
    expectedKeywords = Set.new ["expansion", "data", "research", "mutation", "copy", "number"]
    expectedTopics = Set.new ["united states of america", "corporate/industrial", "medicine"]
    actualKeywords = Set.new
    assigns[:document].keywords.each do |keyword|
      puts keyword.keyword.to_s
      actualKeywords.add(keyword.keyword.to_s)
    end
    actualTopics = Set.new
    assigns[:document].topics.each do |topic|
      puts topic.topic.to_s
      actualTopics.add(topic.topic.to_s)
    end
    assert expectedKeywords == actualKeywords
    assert expectedTopics == actualTopics
    assert_redirected_to document_path(assigns(:document))
  end
  
  test "edit a document by id" do
    document = create(:document)
    get(:edit, {'id' => document.id})
    assert_not_nil assigns(:document)
    assert_equal(assigns["document"], document)
  end
  
  test "update a document" do
    document = create(:document)
    patch(:update, id: document.id, "document"=>{"id" => document.id, "title" => "updated title", "text"=> document.text})
    assert_not_nil assigns(:document)
    assert_equal(assigns["document"].title, "updated title")
    assert_redirected_to document_path(assigns(:document))
  end
  
  test "delete a document" do
    document = create(:document)
    assert_difference('Document.count', -1) do
      delete :destroy, id: document.id
    end
    assert_redirected_to documents_path
  end
  
  test "the test document should have keywords" do
    keyword = create(:document_with_keyword)
    get(:show, {'id' => keyword.document.id})
    assert_not_nil assigns(:document)
    assert_equal(assigns["document"], keyword.document)
    assert_equal(keyword, assigns["document"].keywords.first)
  end

    
end
