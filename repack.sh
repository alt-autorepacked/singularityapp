#!/bin/sh

COMMON_VERSION="0.5.2"

epm tool eget https://raw.githubusercontent.com/alt-autorepacked/common/v$COMMON_VERSION/common.sh
. ./common.sh
rm ./common.sh
# . ../common/common.sh

_package="singularityapp"

epm play singularityapp --save-only --auto
_add_repo_suffix
download_version=$(_check_version_from_download)
remote_version=$(_check_version_from_remote)

if [ "$remote_version" != "$download_version" ]; then
    TAG="v$download_version"
    _create_release
    echo "Release created: $TAG"
else
    echo "No new version to release. Current version: $download_version"
fi