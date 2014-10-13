require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  test "should not be able to save document without ttile" do
    document = Document.new
    assert_not document.save, "Saved the document without a title"
  end
end
