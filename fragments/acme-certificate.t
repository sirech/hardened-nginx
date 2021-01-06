ssl_certificate           /cert/live/{{ . }}/fullchain.pem;
ssl_certificate_key       /cert/live/{{ . }}/privkey.pem;
ssl_trusted_certificate   /cert/live/{{ . }}/chain.pem;