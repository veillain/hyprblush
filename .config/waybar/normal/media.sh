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
        artist=$(playerctl metadata | grep artist | grep -oP 'artist\s+\K.*')
        title=$(playerctl metadata | grep title | grep -oP 'title\s+\K.*')
        if [[ "$status" == Playing ]]; then
            case $1 in
                title)
                    echo "{\"text\": \"${title}\", \"class\": \"normal\"}" | jq --unbuffered --compact-output .
                    ;;
                artist)
                    echo "{\"text\": \"${artist}\", \"class\": \"normal\"}" | jq --unbuffered --compact-output .
                    ;;
            esac
        elif [[ "$status" == Paused ]]; then
            case $1 in
                title)
                    echo "{\"text\": \"${title}\", \"class\": \"paused\"}" | jq --unbuffered --compact-output .
                    ;;
                artist)
                    echo "{\"text\": \"${artist}\", \"class\": \"paused\"}" | jq --unbuffered --compact-output .
                    ;;
            esac
        else
            title=$(echo $HOSTNAME)
            artist=$(whoami)
            case $1 in
                title)
                    echo "{\"text\": \"${title}\", \"class\": \"normal\"}" | jq --unbuffered --compact-output .
                    ;;
                artist)
                    echo "{\"text\": \"${artist}\", \"class\": \"normal\"}" | jq --unbuffered --compact-output .
                    ;;
            esac
            sleep 5
        fi
    done
}

case $1 in
    title) metadata title ;;
    artist) metadata artist ;;
    image) image ;;
esac
