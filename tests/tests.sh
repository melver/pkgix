#!/usr/bin/env bash

test_root="$(cd "${0%/*}" && pwd)"
export PATH="${test_root}/bin:$(cd "${test_root}/../bin" && pwd):$PATH"
exec pkgix tests "$@"
