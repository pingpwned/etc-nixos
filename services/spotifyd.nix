{ pkgs, config, ... }:

{
  services.spotifyd = {
    enable = true;

    config = ''
      [global]
        # Your Spotify account name.
        username = dimanman
        
        # Your Spotify account password.
        password = ${builtins.readFile ./spotifyd.pass}
        
        # The audio backend used to play the your music. To get
        # a list of possible backends, run `spotifyd --help`.
        # backend = alsa
        backend = pulseaudio

        # If set to true, audio data does NOT get cached.
		   	no_audio_cache = false

		   	# Volume on startup between 0 and 100
		   	initial_volume = 90

		   	# If set to true, enables volume normalisation between songs.
		   	volume_normalisation = true

		   	# The normalisation pregain that is applied for each song.
		   	normalisation_pregain = -10

               
        # The displayed device type in Spotify clients.
        # Can be unknown, computer, tablet, smartphone, speaker, tv,
        # avr (Audio/Video Receiver), stb (Set-Top Box), and audiodongle.
        device_type = avr 
    ''; 
  };
}
