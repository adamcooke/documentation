By default, Documentation uses a very very simple search which uses a LIKE query on your database. As this method is far from ideal, Documentation allows additional search backends to be created. 

## Elasticsearch

The recommended method of indexing & searching data is to use Elasticsearch. A module is provided for this [on GitHub](https://github.com/adamcooke/documentation-elasticsearch) and can be installed by following the instructions on the repo's README page.

## Creating your own search backend

To create your own backend, create a new class which inherits from `Documentation::Searchers::Abstract`. This class must confirm to the protocol outlined in this [abstract.rb](https://github.com/adamcooke/documentation/blob/master/lib/documentation/searchers/abstract.rb) file.

## Using your custom backend

Once you have created a backend, you should tell Documentation to use it. Just add the following to your `config/initializers/documentation.rb` file.

```ruby
Documentation.config.searcher = MyCustomSearcher.new
```