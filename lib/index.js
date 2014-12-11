(function() {
  var __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  module.exports = function(Schema) {
    return function(schema, opts) {
      var e, exclude, history_attribute, history_path, path, path_opts, raw_schema_object, _ref;
      if (opts == null) {
        opts = {};
      }
      exclude = (e = opts.exclude || []) instanceof Array ? e : [e];
      history_path = opts.path || 'history';
      raw_schema_object = {};
      _ref = schema.paths;
      for (path in _ref) {
        path_opts = _ref[path];
        if (__indexOf.call(exclude, path) < 0) {
          raw_schema_object[path] = path_opts.options;
        }
      }
      history_attribute = {};
      history_attribute[history_path] = [
        new Schema({
          date_saved: Date,
          object: raw_schema_object
        }, {
          _id: false
        })
      ];
      schema.add(history_attribute);
      return schema.pre('save', function(next) {
        this[history_path].push({
          date_saved: new Date,
          object: this.toObject()
        });
        return next();
      });
    };
  };

}).call(this);
