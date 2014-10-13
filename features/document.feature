Feature: Document

	Scenario: Createing an invalid document
		Given there's a document titled "test" with text "text" 
		 Then I should not be able to save the document
		 