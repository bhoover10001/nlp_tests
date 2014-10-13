NLP Tests
=========
This is a playground for my Ruby on Rails and NLP tests using the Treat Ruby library.  https://github.com/louismullie/treat  For the first pass, the system will automatically do key term extration of a set of texts as well as a simple classification on documents by industry, topic and location. 

Installation
=========
The code is Ruby On Rails, but it does require the Treat Ruby GEM to be both installed and configured correctly, in order to run.
There is excellent documentation on the Treat site https://github.com/louismullie/treat/wiki/Manual#installing-treat-core, but here are the highlights.

After running:

    gem install treat
    
You will have to install the English libraries as well as some models/sample data.  I created a Ruby program with the following code to install the English libraries.

    require 'treat'
    Treat::Core::Installer.install 'english'

After you have run this step, you will need to go into 'treats gem folder' in your Ruby installation
    
You will also need the JAR files with [all models for English](http://louismullie.com/treat/stanford-core-nlp-english.zip) (150 MB)
   
The JAR files should be placed under `{treats gem folder}/bin/stanford/`, and the model files under `{treats gem folder}/models/stanford/` (inside the Treat gem folder).

In order for the topics to work, you will also need to download a general topic classification model, [trained on Reuters news tickets here](http://louismullie.com/treat/reuters/) 

All of the models shoule be placed under '{treats gem folder}/models/reuters'

To run, you should be able to use bundle install from the Ruby on Rails project to install the needed gems. 

Currently, this is running on Windows 8.1 using:
- ruby 2.1.3p242
- Rails 4.1.6
- MySQL 5.5

Details
=========
This is currently a very simplistic NLP library, simply trying to determine key words and topics.  The key words are based on a an tf-idf algorithm where the document associated with the entered link is compared to 6 other documents.  This is clearly not enough training to provide a good sample, because common words, such as "their" are still showing up as key words.

A document's topics are created by using the reuters model, so this whole system will work best when trying to parse press releases.


   
