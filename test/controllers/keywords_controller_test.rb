require 'test_helper'

class KeywordsControllerTest < ActionController::TestCase

  test "should create a keyword" do
    document = create(:document)
    assert_difference('Keyword.count', 1) do
      post :create, document_id: document.id, "keyword" => {"keyword" => "new Keyword"}
    end
    assert_redirected_to document_path(assigns(:document))
  end

end
