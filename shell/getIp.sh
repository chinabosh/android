#!/usr/bin/env bash
ifconfig |grep 192.168|cut -d ' ' -f2
