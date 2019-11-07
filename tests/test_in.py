import requests

def paginate(url):
    last = ""
    data = get_data(url)
    crime_codes = []
    for x in data["results"]:
        if x["crimecode"] not in crime_codes:
            print("Found new")
            crime_codes.append(x["crimecode"])
        if x["crimecode"] != last:
            last = x["crimecode"]
            print("Making switch")
    while(data["next"]):
        data = get_data(data["next"])
        for x in data["results"]:
            if x["crimecode"] not in crime_codes:
                crime_codes.append(x["crimecode"])
                print("Found new")
            if x["crimecode"] != last:
                last = x["crimecode"]
                print("Making switch")

    return crime_codes

def get_data(url):
    data = requests.get(url).json()
    return data

url = "http://localhost/crimeinstances/?crimecode=4A,4C"

c = paginate(url)
print(c)
