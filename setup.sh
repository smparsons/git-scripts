#!/bin/bash
CWD="$(cd -P -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

scripts_directory=$CWD/scripts

chmod -R +x $scripts_directory
ln -s $scripts_directory/cmtpush.sh /usr/local/bin/cmtpush
ln -s $scripts_directory/quickmerge.sh /usr/local/bin/quickmerge