class Application
  
 def call
   
   @@items = []
   
   resp = Rack::Response.new
   req = Rack::Request.new(env)
  
    if req.path.match(/items/)
      song_title = req.path.split("/songs/").last #turn /songs/Sorry into Sorry
      song = @@songs.find{|s| s.title == song_title}
 
      resp.write song.artist
    else
      resp.write "Route not found"
      resp.status = 404
 end
  
end