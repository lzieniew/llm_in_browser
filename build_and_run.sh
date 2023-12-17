#!/usr/bin/env bash

docker build -t llm .
c2w llm /tmp/out-js2/htdocs/out.wasm
cp -R ../container2wasm/examples/wasi-browser/* /tmp/out-js2/ && chmod 755 /tmp/out-js2/htdocs
docker stop docker-httpd
docker run --rm -p 8080:80 --name docker-httpd -v "/tmp/out-js2/htdocs:/usr/local/apache2/htdocs/:ro" \
	-v "/tmp/out-js2/xterm-pty.conf:/usr/local/apache2/conf/extra/xterm-pty.conf:ro" \
	--entrypoint=/bin/sh httpd -c 'echo "Include conf/extra/xterm-pty.conf" >> /usr/local/apache2/conf/httpd.conf && httpd-foreground'
