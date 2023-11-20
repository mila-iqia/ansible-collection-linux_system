Variables to tweak:

nginx_proxy_address: << ip of proxy server >>

nginx_default_ssl_cert: << cert content >>
nginx_default_ssl_key: << key content >>



nginx_proxy_sites:
  - name: "example"
    hostname: "example.com"
    upstream_server: "127.0.0.1:3000"
    limit_conn: "50"  # nginx limit_conn (no zone); optional
    limit_req: "burst=50 nodelay"  # nginx limit_req (no zone); optional
    limit_req_rate: "10r/s"  # nginx limit_req_zone rate option; defaults to 10r/s; ignored if limit_req is not set
    proxy_timeout: "300s"  # set longer timeout for websocket operation; optional (default timeout is 60s)

    # Set both or none of these
    ssl_cert: "<< cert content >>"  # optional; will use the wildcard cert if not set
    ssl_key: "<< key content >>"  # optional; will use the wildcard cert if not set

    client_max_body_size: # nginx client_max_body_size; optional
    proxy_timeout: # nginx proxy_read_timeout and proxy_connect_timeout; set to 300s for websocket operation; optional
    proxy_redirect: # nginx proxy_redirect; optional
    rewrites: # list of nginx custom rewrites; optional