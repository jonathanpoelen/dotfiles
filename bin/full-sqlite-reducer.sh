#!/bin/bash
tmpf=/tmp/sqlite_file_path
l=$(locate \.sqlite \
| xargs -d'\n' mimetype \
| grep 'application/x-sqlite3$' \
| sed 's/:\s*application\/x-sqlite3\s*$//')
echo "$l" | xargs -d'\n' du -hc | tail -n1
while read f ; do
 sqlite3 "$f" 'VACUUM;'
 [ $? -ne 0 ] && echo -e "\tfor $f"
done <<< "$l"
echo "$l" | xargs -d'\n' du -hc | tail -n1
