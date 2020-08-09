Geocoder.configure(

  # street address geocoding service (default :nominatim)
  lookup: :google,

  # IP address geocoding service (default :ipinfo_io)
  # ip_lookup: :maxmind,

  # to use an API key:
  api_key: "AIzaSyDHE7J0_xmhl6aqKXBSGNJas1sY9QV0rzA",

  # geocoding service request timeout, in seconds (default 3):
  timeout: 5,

  # set default units to kilometers:
  units: :km,

)