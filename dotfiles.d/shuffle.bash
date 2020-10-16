function shuffle {
    if [[ $# -ne 1 ]]; then
        echo "usage: shuffle [csv-list-of-terms]"
    else
        python -c "import random; items = '$1'.split(','); random.shuffle(items); print(items);"
    fi
}
