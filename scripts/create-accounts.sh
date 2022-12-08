#!/bin/sh -e
curl -XPOST -d '{"username":"alice", "password":"AliceInWonderland", "inhibit_login":true, "auth": {"type":"m.login.dummy"}}' "http://localhost/_matrix/client/r0/register"
curl -XPOST -d '{"username":"bob", "password":"JoWirSchaffenDas", "inhibit_login":true, "auth": {"type":"m.login.dummy"}}' "http://localhost/_matrix/client/r0/register"
curl -XPOST -d '{"username":"trudy", "password":"HaveIBeenPwned", "inhibit_login":true, "auth": {"type":"m.login.dummy"}}' "http://localhost/_matrix/client/r0/register"
