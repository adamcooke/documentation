As with all Rails engines, you can customize every aspect of the engine within your Rails application.

## Overriding views

You can override views by simply placing new view files in your `app/views` folder. You can see the files which exist and can be overridden in [our views directory](https://github.com/adamcooke/documentation/tree/master/app/views). We use Haml for our views but you can use whatever you want when overriding.

## Internationalization

The interface pulls all its wording from the Rails i18n system. This means you can simply override any wording in your own locale files. The keys available can be found in [our en.yml file](https://github.com/adamcooke/documentation/blob/master/config/locales/en.yml).