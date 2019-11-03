import requests
import time

while(True):
    try:
        requests.get("http://localhost:8000")
        print("*" * 100)
        print("API Ready")
        print("*" * 100)
        break
    except:
        time.sleep(1)
