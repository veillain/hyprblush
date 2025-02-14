#!/bin/bash

image(){
    while true; do
        artUrl=$(playerctl metadata | grep artUrl | awk '{print $3}' | sed 's|file://||')
        cache="/tmp/mediacache"
        thumbnail="/tmp/mediathumbnail"
        magick $artUrl -thumbnail 500x500^ -gravity center -extent 500x500 $cache

        if [[ "$thumbnail" != "$cache" ]]; then
            cp -rf $cache $thumbnail
        fi
        # cp -rf $artUrl /tmp/mediathumbnail
        sleep 5
    done
}

metadata(){
    while true; do
        status=$(playerctl status)
        title=$(playerctl metadata | grep title | grep -oP 'title\s+\K.*')
        artist=$(playerctl metadata | grep artist | grep -oP 'artist\s+\K.*')

        if [[ "$status" == Playing ]]; then
            class="normal"
            sleep 0.5
        elif [[ "$status" == Paused ]]; then
            class="paused"
            sleep 0.5
        else
            class="normal"
            title=$(echo $HOSTNAME)
            artist=$(whoami)
            sleep 5
        fi

        case $1 in
            title)
                echo "{\"text\": \"${title}\", \"class\": \"${class}\"}" | jq --unbuffered --compact-output .
                ;;
            artist)
                echo "{\"text\": \"${artist}\", \"class\": \"${class}\"}" | jq --unbuffered --compact-output .
                ;;
        esac
    done
}

case $1 in
    title) metadata title ;;
    artist) metadata artist ;;
    image) image ;;
esac
