Pages all use standard Markdown markup to format them. There are some additional options though which you may find useful:

## Linking to other pages

If you need to link to other documentation pages, it is important to use the following syntax to ensure the link is maintain regardless of how the page is rendered.

* `[Page](^permalink)` - links from a child of the page where the link is shown
* `[Page](^./permalink)` - links from a sibling of the page where the link is shown
* `[Page](^/permalink) `- links from the root page

It is important to ensure the `^` character is maintained.

## Code Highlighting

Code highlighting is handled by [Pygments](http://pygments.org/). This is a Python library and you may need to install it. Fortunately, installing it is usually as simple as running:

```text
easy_install pygments
```

## Recommendations & Warnings

Any paragraph which is prefixed with `Recommendation:` or `Warning:` will be styled as appropriate. Recommendations are displayed with an information icon and a blue background and warnings are displayed with a warning icon and a yellow background. As shown below:

Recommendation: This is an example recommendation

Warning: This is an example warning.

## Images

If you are embedding images, it is usually best to embed them in the centre of the page. To do to this, simply use the following Markdown:

```text
![My image*center](path/to/image.png)
```

This will embed the image in a `imgcontainer` element with the `center` class. The stylesheet will then take care of the rest.