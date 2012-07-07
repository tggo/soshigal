class App.Routers.AlbumsRouter extends Backbone.Router
  initialize: (options) ->
    App.albumsRouter = this
    @albums = new App.Collections.AlbumsCollection()
    @albums.reset(options.albums) if options and options.albums

  routes:
    'album/new'       : 'new'
    'albums/:id/edit' : 'edit'
    'albums/:id'      : 'show'

  new: ->
    @view = new App.Views.Albums.NewView(collection: @albums)
    $("#content").html(@view.render().el)

  show: (id) ->
    album = (@albums.get(id) || new App.Models.Album(id: id))
    album.fetch(
      success: (model, response) =>
        @view = new App.Views.Albums.ShowView(model: model)
        $("#content").html(@view.render().el)
        @view.initializeUploader()
    )

  edit: (id) ->
    album = (@albums.get(id) || new App.Models.Album(id: id))
    album.fetch(
      success: (model, response) ->
        @view = new App.Views.Albums.EditView(model: model)
        $('#content').html(@view.render().el)
    )
