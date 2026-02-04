#!/bin/bash

# Smart Cart Log Cleanup Script
# Deletes log files older than 3 days

find /home/sysadmin/smart-cart/controllers/va_controller/logs -type f -mtime +3 -delete
find /home/sysadmin/smart-cart/controllers/bs_controller/logs -type f -mtime +3 -delete

