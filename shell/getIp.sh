#!/usr/bin/env bash
ifconfig en0|grep 'inet '|cut -d ' ' -f2
