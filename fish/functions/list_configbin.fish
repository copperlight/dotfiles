function list_configbin
    curl -s $CONFIGBIN | jq -r '.[]'
end

