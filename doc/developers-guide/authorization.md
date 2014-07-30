By default, all pages you create will be visible & editable by anyone. In order to add a level of authorisation, you can define an **Authorizer** what level of access is given to each request.

## Creating an authorizer class

To do this, begin by creating a new class which inherits from `Documentation::Authorizer`. 

```ruby
class MyDocsAuthorizer < Documentation::Authorizer
end
```

Once you have created this class, you can define a number of methods. In all your methods you can access `controller` to access the controller which requested the page. This allows you to access sessions, params or other request information. The methods you can override are as follows:

* `can_use_ui?` - whether the built-in UI can be used
* `can_search?` - whether searching can take place
* `can_view_page?(page)` - whether the provided page can be viewed
* `can_add_page?(page)` - whether a page can be created within the provided page
* `can_reposition_page?(page)` - whether pages within the provided page can be repositioned
* `can_edit_page?(page)` - whether the provided page can be edited
* `can_delete_page?(page)` - whether the provided page can be deleted
* `can_upload?(page)` - whether a file can be uploaded to this page

The default for all these method if left un-defined, is `true`. Here's an example:

```ruby
def can_edit_page?(page)
  controller.request['rack.current_user'].admin?
end
```

## Using your authorizer class

Once you have created your class, you should tell Documentation that it should use it. Do this by adding the following to your `config/initializers/documentation.rb` file`.

```ruby
Documentation.config.authorizer = MyDocsAuthorizer
```