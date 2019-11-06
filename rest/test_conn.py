import requests
import time
import sys

max_retries = 300
curr_try = 0

while(True):
    try:
        requests.get("http://localhost:8000")
        print("API Ready")
        break
    except:
        if max_retries > curr_try:
            time.sleep(1)
            curr_try += 1
        else:
            print("Calling timeout on Rest API connection, check the docker logs")
            sys.exit(-1)
