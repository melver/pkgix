export PKGIX_REPOS="${TEST_REPOS}/10-simple"

test_comment "Initial install."
test_call $EXIT_OK pkgix -n install simple testpackage

test_comment "Install again should do nothing. Testing PKGIX_REPOS."
test_call $EXIT_OK pkgix -n install simple testpackage

verify simple 9321b50a50457fd6a992b43e537514fcdf35a35947e0e1f8617e95bbb4e61abd
verify_log    1fd6e6d0f52a788a6241c25a449206a3d99ec067e6508cf133b4085aa3902bda
