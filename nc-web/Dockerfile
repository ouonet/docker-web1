From busybox
EXPOSE 1500
CMD while true;do  echo -e "HTTP/1.1 200 OK\nContent-Type: text/html\n\n<h1>Hello World!</h1>  form $HOSTNAME</br>$(date)" | nc -l -p 1500 ;done
