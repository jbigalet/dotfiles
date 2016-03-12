#!/usr/bin/env python3
#-------------------------------------------------
import argparse
import requests
import sys
from subprocess import Popen, PIPE, STDOUT

class Stream(object):
    def __init__(self, data, options):
        self.name = data["name"]
        self.status = data["status"]
        self.viewers = data["viewers"]
        self.game = data["game"]
        self.options = options

    def display_string(self):
        display_string = u"{} ({}) {}- {}\n".format(self.name, self.viewers, "[" + self.game + "] " if self.options["show_game"] else "", self.status).strip()
        return display_string + "\n"

def create_arg_parser():
    parser = argparse.ArgumentParser(description=
             'Open twitch stream through dmenu.')
    parser.add_argument(
        '-c', '--count', required=False, default=10, type=int,
        help='How many (default: 10) streams should be displayed?')
    parser.add_argument(
        '-g', '--game', required=False, default="Hearthstone%3A%20Heroes%20of%20Warcraft", type=str,
        help='Which game (default: None)?')
    parser.add_argument(
        '-q', '--quality', required=False, default="best", type=str,
        help='Which quality (default: best)?')
    parser.add_argument(
        '-p', '--player', required=False, default="vlc", type=str,
        help='Which player (default: vlc)?')

    parser.add_argument(
        '-nf', '--dmenu-nf', required=False, default="#899CA1", type=str,
        help='Dmenu normal foreground color?')
    parser.add_argument(
        '-nb', '--dmenu-nb', required=False, default="#2D2D2D", type=str,
        help='Dmenu normal background color?')
    parser.add_argument(
        '-sf', '--dmenu-sf', required=False, default="#C0C0C0", type=str,
        help='Dmenu selected foreground color?')
    parser.add_argument(
        '-sb', '--dmenu-sb', required=False, default="#2D2D2D", type=str,
        help='Dmenu selected background color?')
    parser.add_argument(
        '-fn', '--dmenu-fn', required=False, default="-*-terminus-medium-*-*-*-16-*-*-*-*-*-*-*", type=str,
        help='Dmenu font?')
    return vars(parser.parse_args());

def main():
    args = create_arg_parser()

    count = args['count']
    game = args['game']
    quality = args['quality']
    player = args['player']

    # twitch theme: twitcher.py -nf '#ccc' -nb '#301F4F' -sf '#fff' -sb '#6441a5'
    dmenu_command = ['dmenu',
        '-l', str(count),
        '-nf', args['dmenu_nf'],
        '-nb', args['dmenu_nb'],
        '-sb', args['dmenu_sb'],
        '-sf', args['dmenu_sf'],
        '-fn', args['dmenu_fn']
    ]

    url = "https://api.twitch.tv/kraken/streams?limit={}".format(count)
    if game:
        url += "&game={}".format(game.replace(' ','+'))

    r = requests.get(url)
    json_streams = r.json()["streams"]
    streams = []
    for json_stream in json_streams:
        channel = json_stream.get("channel", "")
        name = channel.get("name", "")
        status = channel.get("status", "")
        viewers = json_stream.get("viewers", "")
        stream_game = channel.get("game", "")
        stream_data = { "name": name, "status": status, "viewers": viewers, "game": stream_game }
        streams.append(Stream(stream_data, { "show_game": not bool(game) }))

    dmenu_str = ""
    for stream in streams:
        dmenu_str += stream.display_string()
    dmenu_str.strip()

    p = Popen(dmenu_command, stdout=PIPE, stdin=PIPE, stderr=STDOUT)
    stream_selection = p.communicate(input=dmenu_str.encode('utf-8'))[0]
    if stream_selection:
        livestreamer_url = "twitch.tv/{} {} -p {}".format(stream_selection.decode('utf-8').split()[0], quality, player)
        Popen(["livestreamer", "twitch.tv/" + stream_selection.decode('utf-8').split()[0], quality, "-p", player], stdout=open('/dev/null', 'w'), stderr=open('/dev/null', 'w'))
        sys.exit(0)

if __name__ == "__main__":
    main()
