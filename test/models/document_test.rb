require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  test "should not be able to save document without title" do
    document = FactoryGirl.build(:document, title: "")
    assert_not document.save, "Saved the document without a title"
  end
  test "should not be able to save document without text" do
    document = FactoryGirl.build(:document, text: "")
    assert_not document.save, "Saved the document without a text"
  end
  test "should be able to save the document" do
    document = FactoryGirl.build(:document)
    assert document.save, "Saved the document correctly"
    assert_equal(document.created_at, Time.now)
  end
end
