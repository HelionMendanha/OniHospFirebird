#!/bin/bash


date

uptime

systemctl status firebird-superclassic

systemctl stop firebird-superclassic

sleep 2

systemctl start firebird-superclassic

systemctl status firebird-superclassic

