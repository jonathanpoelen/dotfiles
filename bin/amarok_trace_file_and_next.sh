#!/bin/sh
qdbus org.kde.amarok /TrackList org.freedesktop.MediaPlayer.GetMetadata \
  $(qdbus org.kde.amarok /TrackList org.freedesktop.MediaPlayer.GetCurrentTrack) \
| grep -m1 ^location \
| perl -pe 's#location: file://##,s|%([0-9a-f]{2})|pack('C',hex($1))|segi;' \
>> ~/track_passed.txt
qdbus org.mpris.MediaPlayer2.amarok /Player org.freedesktop.MediaPlayer.Next
