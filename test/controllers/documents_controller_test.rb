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
  
  test "should create document" do
    document = build(:document)
    assert_difference('Document.count') do
      post :create, document: {title: document.title, text: document.text}
    end
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
