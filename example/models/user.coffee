{Schema} = require 'mongoose'
history = require '../lib/mongoose-history'

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
