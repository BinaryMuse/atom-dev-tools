{CompositeDisposable} = require 'atom'

Rx = require 'rx'

window.Rx = Rx

module.exports = AtomDevTools =
  activate: (state) ->
    window.dev =
      watchCommands: ->
        Rx.Observable
          .create (o) -> atom.commands.onDidDispatch(o.onNext.bind(o))
          .map (evt) -> evt.type
          .filter (evt) -> evt isnt "blur"
          .subscribe console.log.bind(console)


  deactivate: ->
    delete window.dev
