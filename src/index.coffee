module.exports = (Schema) -> (schema, opts={}) ->
  exclude = if (e = (opts.exclude or [])) instanceof Array then e else [e]
  history_path = opts.path or 'history'

  raw_schema_object = {}
  for path, path_opts of schema.paths when path not in exclude
    raw_schema_object[path] = path_opts.options

  history_attribute = {}
  history_attribute[history_path] = [
    new Schema
      date_saved: Date
      object: raw_schema_object
    , {_id: false}
  ]

  schema.add history_attribute

  schema.pre 'save', (next) ->
    @[history_path].push
      date_saved: new Date
      object: @toObject()

    next()
