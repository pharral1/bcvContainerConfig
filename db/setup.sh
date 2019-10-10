#!/bin/bash
set -e

mysql < /app/BCV_Database/BCV_createAll.sql
mysql < /app/BCV_Database/BCV_loadAll.sql
mysql < /app/BCV_Database/BCV_createAPIUser.sql
