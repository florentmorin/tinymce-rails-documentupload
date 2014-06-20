# IMPORTANT NOTE:
This version is being rewritten to work with TinyMCE 4.x, and is currently not very tested. Use at your own risk, feedback welcome. For the stable version targetting TinyMCE 3, see the [tinymce3 branch](https://github.com/florentmorin/tinymce-rails-documentupload/tree/tinymce3)

# tinymce-rails-documentupload

  Simple plugin for TinyMCE that allows uploading documents and inserting.
  It makes no assumptions about how you store the documents, but it POSTs to a URL and expects JSON back (see the Setup section).

  This plugin is adapted from work done by [Christian Bechström Viken for TinyMCE Rails Image Upload plugin](https://github.com/PerfectlyNormal/tinymce-rails-imageupload).

  The icon used for the button comes from the icon set [Silk by famfamfam](http://www.famfamfam.com/lab/icons/silk/) and the spinner image from [ajaxload.info](http://ajaxload.info/).
  
  Support for TinyMCE 3 is currently available in the [tinymce3 branch](https://github.com/florentmorin/tinymce-rails-documentupload/tree/tinymce3). The master branch is targetting TinyMCE 4.x.

## Requirements

  * Rails >= 3.1
  * TinyMCE4 using the advanced theme

## Setup

### Add the gem to your Gemfile

    gem 'tinymce-rails-documentupload', '~> 4.0.0.beta'
    
    # or use git

    gem 'tinymce-rails-documentupload', github: 'florentmorin/tinymce-rails-documentupload'

### Set up TinyMCE as you would normally, but in the call to `.tinymce()`, add

    plugins: "uploaddocument"
    # toolbar option must include "uploaddocument" somewhere to have the button appear

  and the rest should happen automatically.

### Set up upload URL and handler

  The plugin defaults to POSTing to `/tinymce_documents`.  You may modify it by supplying option `uploaddocument_form_url` in the call to `.tinymce()`

  Routing to your controller must be done manually.  Set it up using something similar in `routes.rb`:

    post '/tinymce_documents' => 'tinymce_documents#create'

  The plugin will relay option `uploaddocument_hint` in the call to `.tinymce()` to the POSTed URL as param `hint`.  You may use this to relay any hints you wish (for example, blog post ID #) to the controller.

  This action gets called with a file parameter creatively called `file`, and must respond with JSON, containing the URL to the document.

  The JSON has to be returned with a content type of "text/html" to work, which is going to be fixed as soon as possible ([issue #7](https://github.com/PerfectlyNormal/tinymce-rails-imageupload/issues/7)).

  Example:

    class TinymceDocumentsController < ApplicationController
      def create
        # Take upload from params[:file] and store it somehow...
        # Optionally also accept params[:hint] and consume if needed

        render json: {
          document: {
            url: view_context.document_url(image)
          }
        }, layout: false, content_type: "text/html"
      end
    end

  If the JSON response contains a `thumb` object with `url` and `width` and/or `height` key, those will be used in the inserted HTML (`<a href="..."><img src="..." width="..." height="..." alt="..."></a>`), but if those are not present, the inserted HTML is just `<a href="...">description</a>`.

### Default class for a tag

  By default the plugin doesn't assign any class to the a tag. You can set the class(es) by supplying the `uploaddocument_default_a_class` option in the call to `.tinymce()`.

  `class="..."` will only be added to the a tag if a default is specified. Otherwise the inserted HTML is just `<a href="...">`.

## Error handling

To notify the uploader that an error occurred, return JSON containing a `error` key with a `message`.
The message gets show in a paragraph with the ID `error_message`, and the input label gets the class `invalid`.

Example response:

    "{"error": {"message": "Invalid file type. Only .jpg, .png and .gif allowed"}}"

## Internationalization

I18n is taken care of by `tinymce-rails`. This gem includes strings for `en` and `fr`. To add your own language, create the files `<code>.js` in `app/assets/javascripts/tinymce/plugins/uploaddocument/langs` in your application, or fork the gem and add your own translations there.
  
The format and available strings are listed below:

### fr.js

    tinyMCE.addI18n('fr', {
      'Insert a document from your computer': 'Insérer un document depuis votre ordinateur',
      'Insert document': "Insérer un document",
      'Choose a document': "Choisir un document",
      'You must choose a file': "Vous devez choisir un fichier",
      'Got a bad response from the server': "Mauvaise réponse du serveur",
      "Didn't get a response from the server": "Aucune réponse du serveur",
      'Insert': "Insérer",
      'Cancel': "Annuler",
      'Document description': "Description du document",
      'Click to download' : "Cliquer pour télécharger",
    });

## Versioning

The major, minor and patch version of this gem will be mirroring the release of `tinymce-rails` it is tested against.

## Licensing

The plugin is released under the MIT license.

TinyMCE is released under the LGPL Version 2.1.

The icon used for the button comes from the icon set Silk from famfamfam, released under the [Creative Commons Attribution 3.0 License](http://creativecommons.org/licenses/by/3.0/)