
This may need further expanding.

- Commit summary: ``<subtopic>: Summary`` (e.g., current topics: pkgix, doc,
  translation, test).

- Need "Signed-off-by": ``git commit -s``

- GPG-sign new release tags: ``git tag -s <tag> -m <comment> && git push --tags <remote>``

  Verify with ``git tag -v <tag>``.

- pkgix should be minimal; goal is below 3000 LOC.

