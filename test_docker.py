import requests

def main():
    resp = requests.get("http://localhost:8000/inputdata/", params={"crimedate__year": "2020"})
    resp.raise_for_status()
    print(resp.json()["count"])

if __name__ == "__main__":
    main()
