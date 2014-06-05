#!/bin/sh
/usr/lib/x86_64-linux-gnu/qt4/bin/qdbus org.kde.amarok /TrackList org.freedesktop.MediaPlayer.GetMetadata $(/usr/lib/x86_64-linux-gnu/qt4/bin/qdbus org.kde.amarok /TrackList org.freedesktop.MediaPlayer.GetCurrentTrack) | grep -m1 ^location | perl -pe 's#location: file://##,s|%([0-9a-f]{2})|pack('C',hex($1))|segi;' >> /home/jonathan/track_passed.txt
/usr/lib/x86_64-linux-gnu/qt4/bin/qdbus org.mpris.MediaPlayer2.amarok /Player org.freedesktop.MediaPlayer.Next
