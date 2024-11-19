#!/usr/bin/env python3
"""
Script creates notifications (mainly for hyprnotify, but can be handled by any notifcation manager) for new messages 
(that are not junk or already read).

The script is based on the Example script "/extendedMode/logging/script-connectionless.py" (MIT, 2022, Stephan Helma):
https://github.com/electrotype/thunderbird-addon-scriptable-notifications/blob/main/scriptExamples/extendedMode/logging/script-connectionless.py

This script uses the Add-On "Scriptable Notifications" for Thunderbird.
It uses Extended Mode with Connectionless data (See the Add-On Settings).

The script is loaded via ~/.mozilla/native-messaging-hosts/scriptableNotifications.json
You will likely need to change the path there, as it has to be an absolute path

MIT License
Copyright (C) 2024 Lukas "DerGeneralFluff" Lichten

"""

import json
import pathlib
import pprint
import struct
import sys
import time
import traceback
import subprocess


def debug_print(obj):
    # Debugging pretty print
    log_file = pathlib.Path(
        '~', pathlib.Path(__file__).with_suffix('.log').name
        ).expanduser()

    with open(log_file, 'a') as f:
        try:
            print(f'====== {time.asctime()} ======', file=f)
            pp = pprint.PrettyPrinter(stream=f)
            pp.pprint(obj)

        except Exception as e:
            # If anything goes wrong, write the traceback to the logfile
            print(
                f'EXCEPTION: '
                f'{"".join(traceback.format_exception(type(e), e, e.__traceback__))}',
                file=f)

#
# Helper functions
#

def get_message():
    """Get message from the standard input."""
    raw_length = sys.stdin.buffer.read(4)
    if len(raw_length) == 0:
        return {}
    length = struct.unpack('@I', raw_length)[0]
    message = sys.stdin.buffer.read(length).decode('utf-8')
    return message

#
# Main function
#

def main():
    # Get message sent
    message = get_message()

    # Parse the message
    payload = json.loads(message)

    if payload['event'] == 'new':
        mail = payload['message']

        # when debugging remove if statement, as the new message example does have read set to true, 
        # so the debug message would get filtered
        if not mail['junk'] and not mail['read']:
            notify_email(mail)


# Takes as input the "message" field from a new event
def notify_email(mail):
    # time t meassured in ms
    subprocess.run(['notify-send', '-t', '15000', mail['author'], mail['subject']])


if __name__ == '__main__':
    main()
