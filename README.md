## smsway_api [![Build Status](https://travis-ci.org/KELiON/smsway_api.svg)](http://travis-ci.org/KELiON/smsway_api) [![Gem Version](https://badge.fury.io/rb/smsway_api.png)](http://badge.fury.io/rb/smswy_api) [![Dependency Status](https://gemnasium.com/KELiON/smsway_api.svg)](https://gemnasium.com/KELiON/smsway_api) [![Code Climate](https://codeclimate.com/github/KELiON/smsway_api.png)](https://codeclimate.com/github/KELiON/smsway_api)

Ruby wrapper for smsway.ru xml api

## Installation

``` ruby
# Gemfile
gem 'smsway_api'
```

or just

``` sh
$ gem install smsway_api
```

## Config

Parameters for smsway_api should be placed in SmswayApi.configure block. Put smsway_api.rb into `config/initializers` directory of your rails application or just run:

     rails generate smsway_api:install

Example of config file: 


    SmswayApi.configure do |config|
      config.login = '123'
      config.password = 'AbCdE654'
    

      config.default_sender = 'smsway'
    end

## Usage

Now implemented only two methods of smsway api: send message and get balance. You can send sms, flash-sms, wap-push and vcard.

Simple sending message: `SmswayApi::API.send_message('test message', phone)`.
Building and sending VCard:

    vcard = SmswayApi::Message::Vcard.new({
      name: 'Steave Jobs',
      email: 'jobs@apple.com',
      phone: {
        work: '1-800-275-2273'
      }
    })
    vcard.add_recipient('1-800-694-7466')
    vcard.add_recipient('1-800-800-2775')
    vcard.sender = 'apple'
    SmswayApi::API.send_message(vcard)

This example will send vcard to two recipients. Field 'from' will be 'apple'.

Get balance:
   
    SmswayApi::API.balance

