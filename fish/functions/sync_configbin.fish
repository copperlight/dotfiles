function sync_configbin
    mkdir configbin
    pushd configbin
    curl -s $CONFIGBIN/$argv | jq -r '.[]' | xargs -P 10 -I XXX curl -s -O $base_url/$argv/XXX
    popd
end
