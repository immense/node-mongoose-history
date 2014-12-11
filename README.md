# Mongoose History

Mongoose History is a [mongoose plugin](http://mongoosejs.com/docs/plugins.html)
that adds a history column to your mongoose models

## Installation

To install it in your node project, run `npm install node-mongoose-history --save`.

## Usage

```coffeescript
Schema = require('mongoose').Schema
history_plugin = require('node-mongoose-history')(Schema)

UserSchema = new Schema
  username:  String
  password:  String
  full_name: String

# To change the name of the history column (default: 'history'):
UserSchema.plugin history, path: 'historical_data'

# To track everything but the password:
UserSchema.plugin history, exclude: 'password'

# To track just the username:
UserSchema.plugin history, exclude: ['password', 'full_name']
```

## Building

To build the Mongoose History coffeescript source, do the following in a node.js-enabled environment:

```
npm install -g grunt-cli
npm install
grunt
```

## License

Mongoose History is released under the MIT License. Please see the LICENSE file for details.
