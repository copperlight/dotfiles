function check_compression
    curl -I -H 'Accept-Encoding: gzip,deflate' $argv |grep "Content-Encoding"
end
