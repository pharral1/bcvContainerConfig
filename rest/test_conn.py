import requests
import time

while(True):
    try:
        requests.get("http://localhost:8000")
        print("API Ready")
        break
    except:
        time.sleep(1)
