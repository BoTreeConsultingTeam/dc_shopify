This is simple app which would create products feed as per the [schema](http://verticals.dynamiccreative.com/v1/retail_standard.xsd) by fetching products from a shopify store.

#### Installation

Run `bundle` from the home directory

#### Configuration

Need to set following environment variables to connect with shopify API
1. `SHOPIFY_API_KEY`
2. `SHOPIFY_API_PASSWORD`
3. `SHOP_NAME`

#### How to run the test suite

Run following command From the root directory

`SHOPIFY_API_KEY=<SHOPIFY API KEY> SHOPIFY_API_PASSWORD=<SHOPIFY API PASSWORD> SHOP_NAME=<STORES NAME YOU USE TO ACCESS FROM BROWSER> spring rspec spec`

**Note:** The current version of VCR creates [issue](https://github.com/vcr/vcr/issues/637) with Ruby 2.4.1 but highly recommend to use it to avoid flaky and slow tests.  

#### How to run the app

1. Start Server using `rails s` assuming all required environment variables are already set
2. Hit `http://localhost:3000` in browser