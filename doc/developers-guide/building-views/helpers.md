All the helpers needed to do this are provided for you and are shown below. These are the same helpers which are used in the built-in interface.

-------------

### `documentation_breadcrumb_for(page)`

This helper will return an unordered list containing a breadcrumb trail for the page you provide. The output will look something like this:

```html
<nav class='breadcrumb'>
  <ul>
    <li><a href='/'>Home</a></li>
    <li><a href='/example'>Example</a></li>
    <li><a href='/example/page'>Page</a></li>
  </ul>
</nav>
```

#### Options for this helper

* `:class` - allows you to set the class for the outer nav element. Defaults to 'breadcrumb'.
* `:root_link` - sets the text for the first link in the breadcrumb. Defaults to 'Home' (taken from the i18n). Set to false to exclude this item.

-------------

### `documentation_navigation_tree_for(page)`

Provides a single-level nested unordered list which contains the given page. If the given page has no children, its parents will be included. If it has children, they will be shown too. The active page will include the `active` class.

```html
<ul>
  <li><a href='/example'>Example Section</a></li>
  <li>
    <a href='/food'>Information about food</a>
    <ul>
      <li><a href='/foot/fruit'>Fruit</a></li>
      <li><a href='/foot/vegetables' class='active'>Vegetables</a></li>
      <li><a href='/foot/meat'>Meat</a></li>
    </ul>
  </li>
  <li><a href='/drink'>Information about drink</a></li>
</ul>
```

-------------

### `documentation_content_for(page)`

Renders the content for a given page. This will deal with ensuring that the page is unescaped and that any formatting options are correctly parsed.

-------------

### `documentation_authorizer`

Returns the documentation authorizer.

-------------

### `documentation_edit_page_path(page)`

Returns the path to edit the given page in the provided UI.

-------------

### `documentation_page_path(page)`

Returns the path to view the given page in the provided UI.

-------------

### `documentation_search_summary(result)`

Returns information about your search result

-------------

### `documentation_search_results(result, options)`

Return an unordered list containing your search results.

```html
<ul class='searchResults'>
  <li>
    <h4><a href='path/to/page'>Title of page</a></h4>
    <p class='in'><!--- Other pages if they exist --></p>
    <p class='except'>An excerpt goes <mark>here</mark></p>
  </li>
</ul>
```

#### Options for this helper

* `:class` - the class for the outer list

-------------

### `documentation_search_pagination(result, options)`

Return a next page and previous page link based on the results

#### Options for this helper

* `:link_class` - the class to apply to both links
* `:next_link_class` - the class for the next link
* `:previous_link_class` - the class for the previous link
