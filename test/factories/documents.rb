
FactoryGirl.define do
  factory :document do
    url "http://www.collabrx.com/collabrx-launches-expansion-of-its-genetic-variation-annotation-service-to-support-copy-number-variation-cnv-data/"
    title "CollabRx Announces Successful Launch of CancerRx™ Mobile Oncology App"
    text "The CancerRx app provides expert-vetted treatment options that take into account the genetics of patients’ tumors.  These options include published clinical treatment guidelines as well as guidance for “beyond standard of care” options based on medical and scientific evidence.  Treatment options are developed in close collaboration with CollabRx’s expert advisory network, which is composed of over 75 leading physicians, scientists, and researchers from the nation’s most prestigious academic and medical institutions.  A special feature of CancerRx is a daily oncology newsfeed from MedPage Today, all with real-time over the air updates."
  end

  factory :document_with_keyword, class: Keyword do
    document
    keyword "keywordTest"
  end
end


