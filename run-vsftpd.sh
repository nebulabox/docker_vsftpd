#!/bin/bash

echo -e "test\ntest" | passwd test

# Run vsftpd:
&>/dev/null /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
